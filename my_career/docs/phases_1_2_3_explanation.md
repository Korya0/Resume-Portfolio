# The Architectural Foundation (Phases 1, 2, & 3)
*A Comprehensive Guide from your Tech Lead*

Welcome to the engineering team! Our goal here is not just to build an app that works; it is to build a system that is scalable, highly maintainable, and completely resistant to "spaghetti code." As you read this, I want you to adopt the mindset of an architect. I will explain exactly *what* we built in Phases 1, 2, and 3, but more importantly, *why* we built it this way. Do not skim this document—this is your blueprint.

---

## The Big Picture: Clean Architecture & Feature-First Directory
If you look at our `lib/` directory, you'll see two main folders: `core/` and `features/`. 
Most beginners group files by type: all UI files in one folder, all models in another. This works for small apps but becomes a nightmare as the app grows. Instead, we use a **Feature-First Architecture**.
If a developer joins our team to fix a bug in the "Books" section, they only need to look inside `lib/features/books/`. If we decide to delete the "Problems" feature, we just delete the `problems/` folder, and the rest of the application remains untouched. 

---

## 1. Project Configuration & Assets

### `pubspec.yaml`
This file is the heartbeat of our dependencies. Here is the rationale behind our chosen stack:
- **`flutter_bloc`**: The gold standard for Enterprise state management. It separates our UI from our business logic entirely using streams and strictly defined events/states.
- **`get_it`**: A Service Locator. Instead of passing objects down the widget tree through constructors (Prop Drilling), GetIt gives us a globally accessible container to request instances like Repositories or Services when we need them.
- **`go_router`**: Flutter's recommended routing package. Native routing (`Navigator.push`) breaks easily on Web and complicated deep-linking. `go_router` uses a declarative URL-based approach. We will be using it for complex nested navigation (Tabs / ShellRoutes).
- **`shared_preferences`**: Our local persistence layer. We use it to store all user data since this app requires no external internet server.
- **`json_annotation` & `build_runner`**: Code generation engines for JSON parsing.

### Asset Optimization (`assets/fonts/`)
You might wonder why we replaced the `google_fonts` package with local `.ttf` files.
When you use runtime Google Fonts, the app makes an HTTP request to download the font when a user opens a screen. This causes visual shifting (text blinking into standard fonts temporarily) and fails if the user is offline.
By importing `- asset: assets/fonts/DM_Sans/DMSans-Regular.ttf` locally, the text renders instantly at 60FPS. I also manually deleted over 60 unused weights of DM Sans and Space Mono to drop our total app bundle size dramatically.

---

## 2. Phase 1: The Core Infrastructure

The `core/` folder handles cross-cutting concerns—things the whole app relies on, irrespective of the specific feature.

### A. Application Entry Points
**`lib/main.dart`**
This is the starting line. Look at the code closely:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(const MyCareerApp());
}
```
1. `WidgetsFlutterBinding.ensureInitialized();`: You *must* call this anytime your `main` method is marked `async`. It tells the native iOS/Android/Web engine to get ready because we are going to interact with native platform channels (like SharedPreferences) before the Flutter UI paints.
2. `await initDI();`: Our Dependency Injection bootup. We pause execution entirely until all crucial services (like our internal storage) are fully loaded into memory.

**`lib/app.dart`**
Why didn't we just return `MaterialApp` directly in `main.dart`? Separation of concerns. `main.dart` configures the physical environment. `app.dart` configures the *UI root*. This allows us to write automated integration tests easily by importing `MyCareerApp` directly without running the complex initialization logic in `main`.
Here we attach `theme: AppTheme.darkTheme` and `routerConfig: appRouter`.

### B. Dependency Injection
**`lib/core/di/injection.dart`**
This is where `get_it` shines. There are two critical functions used here:
1. `registerSingleton`: Used for our `LocalStorageService`. A Singleton means only *one* instance of this class will ever exist in memory. It boots up immediately when the app starts.
2. `registerLazySingleton`: Used for our Repositories (e.g., `BooksRepository`). "Lazy" means this class is NOT created when the app boots. It is only created the absolute first time a user tries to access it (e.g., opening the Books page). This keeps our start-up extremely fast and saves RAM!

### C. Persistent Storage
**`lib/core/storage/local_storage_service.dart`**
Notice that we wrote an `abstract class LocalStorageService` acting as an Interface, and then a concrete `LocalStorageServiceImpl` wrapping SharedPreferences. 
**Why not use SharedPreferences directly everywhere?**
Because of the **Dependency Inversion Principle (SOLID)**. If, in six months, we decide SharedPreferences is too slow and we want to use `Hive` or `Isar` (NoSQL databases), we do NOT want to search through 50 files replacing code. We simply create `HiveStorageServiceImpl implements LocalStorageService` and swap it in `injection.dart`. The rest of the app won't even notice.

### D. Theming Engine
**`lib/core/theme/app_theme.dart`**
We centralized all styling here utilizing **Material 3**. 
- `fontFamily: 'DM Sans'`: By setting this globally here, every single `Text()` widget created in the entire app will default to DM Sans. We never have to manually apply it.
- `colorScheme`: We explicitly mapped `surface` and `primary` to our hex codes. We removed the `background` property entirely because Google deprecated it in recent Flutter updates; `surface` is now the unified standard in Material Design 3.

### E. Navigation Boilerplate
**`lib/core/router/app_routes.dart` & `lib/core/router/app_router.dart`**
- `app_routes.dart`: A file containing simple strings: `static const String home = '/';`. If a developer mistypes a string during navigation, the app crashes. By locking paths into strict constants, the IDE catches errors automatically.
- `app_router.dart`: Instantiates the `GoRouter` root tree. Right now it just holds a placeholder `Scaffold`, but soon we will wrap it in a `ShellRoute`. A ShellRoute allows a fixed UI exterior (like an always-visible Bottom/Side Navigation bar) while the inner routes (pages) change fluidly without reloading the shell.

---

## 3. Phase 2: The Domain Layer (Entities)

If the `core/` is the engine, the Domain Layer is the soul of our logic. `lib/features/.../domain/entities/` contains classes completely isolated from Flutter Widgets or APIs. They are pure data representations.

**1. The `Book`, `Problem`, and `RoadmapSection` Classes**
A proper entity should be *Immutable*. We enforce this using `final` variables and `const` constructors. Once a `Book` object is created in RAM, its properties cannot be changed directly; you must create a new mutated copy. This protects the app from weird state bugs.

**2. The JSON Code Generation Magic (`json_annotation`)**
Why did we write `@JsonSerializable()` over our entities, and `part 'book.g.dart';`?
A common Junior developer mistake is mapping JSON manually:
`title: json['title'],`. 
If you accidentally misspell "title" as "tittle", the app crashes at runtime, and the compiler can't warn you.
By using `json_annotation`, we run the terminal command `dart run build_runner build -d`. The machine writes a highly-optimized `.g.dart` file automatically that safely extracts values, ensures null safety, and guarantees 0% human typo rates in mapping. 
- `fromJson` turns raw database Strings/Maps into readable Dart objects.
- `toJson` breaks our Dart Objects back down into basic text/numbers so SharedPreferences can save it.

---

## 4. Phase 3: The Data Layer (Repositories)

Located in `lib/features/.../data/repositories/`.

**The Bridge: `books_repository.dart`**
A Repository sits exactly between the Domain logic (Entities) and the Storage logic (LocalStorageService).
Its exact job is to abstract away data complexities. When a BLoC/Cubit asks for a list of books, it doesn't care if the books come from the internet, a local database, or text files holding JSON. The repository hides that implementation.

Look at how `books_repository.dart` works:
1. **Dependency Injection**: It requires `LocalStorageService` to be passed into its constructor. It does *not* create its own storage logic.
2. **`getBooks()`**:
   - Queries Storage using a private constant key (`_booksKey`).
   - If empty or null, it gracefully returns an empty array `[]` so the UI doesn't crash throwing null exceptions.
   - If data exists, it uses `jsonDecode` to turn the raw String into a `List<dynamic>`.
   - It iterates over that List, using our trusty `Book.fromJson()`, returning a clean `List<Book>`.
3. **`saveBooks()`**:
   - Takes a `List<Book>`, calls `.toJson()` on all elements, encodes them, and safely writes them back to the hard drive holding the user's progress.

**The other repositories** (`roadmap_repository`, `tips_repository`, etc.) will follow this exact immutable architectural pattern, guaranteeing a uniform read/write cycle.

---

## Conclusion & What's Next?
By the end of Phase 3, we have fully built the "Brain", "Nerves", and "Skeleton" of the application. 
- The Dependency Injector is awake.
- The Persistence Storage is operational.
- The Core Domain objects are rigidly typed.
- The Repositories are successfully bridging logic.

**We are now perfectly positioned for Phase 4.** 
In Phase 4, we will finally begin laying on the "Skin". We will create reusable standalone generic UI Widgets (Buttons, Application Cards, Progress Bars, TextFields) mapping directly to our `AppTheme`. We do this generically first so developers throughout the project don't reinvent new button configurations on every single feature branch.

*Review this logic closely. Master it. Because everything we build moving forward relies on this exact foundation remaining unbroken.*
