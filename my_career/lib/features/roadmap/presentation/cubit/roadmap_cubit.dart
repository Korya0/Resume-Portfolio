import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/roadmap_section.dart';
import '../../domain/entities/roadmap_item.dart';
import '../../data/repositories/roadmap_repository.dart';

abstract class RoadmapState {}

class RoadmapInitial extends RoadmapState {}
class RoadmapLoading extends RoadmapState {}
class RoadmapLoaded extends RoadmapState {
  final List<RoadmapSection> sections;
  final double overallProgress;
  RoadmapLoaded({required this.sections, required this.overallProgress});
}
class RoadmapError extends RoadmapState {
  final String message;
  RoadmapError(this.message);
}

class RoadmapCubit extends Cubit<RoadmapState> {
  final RoadmapRepository _repository;

  RoadmapCubit(this._repository) : super(RoadmapInitial());

  Future<void> loadRoadmap() async {
    emit(RoadmapLoading());
    try {
      final sections = await _repository.getSections();
      if (sections.isEmpty) {
        // Initial dummy data for testing if empty
        final initialSections = [
          const RoadmapSection(id: '1', title: 'Fundamentals', items: [
            RoadmapItem(id: '101', title: 'What is Flutter?', tags: ['NEW']),
            RoadmapItem(id: '102', title: 'Dart Basics', tags: ['ADV']),
          ]),
          const RoadmapSection(id: '2', title: 'Widgets', items: [
            RoadmapItem(id: '201', title: 'Stateless vs Stateful'),
            RoadmapItem(id: '202', title: 'Layout Widgets'),
          ]),
        ];
        await _repository.saveSections(initialSections);
        _calculateAndEmit(initialSections);
      } else {
        _calculateAndEmit(sections);
      }
    } catch (e) {
      emit(RoadmapError(e.toString()));
    }
  }

  void _calculateAndEmit(List<RoadmapSection> sections) {
    int totalItems = 0;
    int completedItems = 0;

    for (var section in sections) {
      totalItems += section.items.length;
      completedItems += section.items.where((item) => item.isCompleted).length;
    }

    final progress = totalItems == 0 ? 0.0 : completedItems / totalItems;
    emit(RoadmapLoaded(sections: sections, overallProgress: progress));
  }

  Future<void> toggleItem(String sectionId, String itemId) async {
    if (state is! RoadmapLoaded) return;
    
    final currentSections = List<RoadmapSection>.from((state as RoadmapLoaded).sections);
    
    final newSections = currentSections.map((section) {
      if (section.id == sectionId) {
        final newItems = section.items.map((item) {
          if (item.id == itemId) {
            return RoadmapItem(
              id: item.id,
              title: item.title,
              isCompleted: !item.isCompleted,
              tags: item.tags,
              mastery: item.mastery,
            );
          }
          return item;
        }).toList();
        return RoadmapSection(id: section.id, title: section.title, items: newItems);
      }
      return section;
    }).toList();

    await _repository.saveSections(newSections);
    _calculateAndEmit(newSections);
  }
}
