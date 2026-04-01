import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/sidebar_link.dart';
import '../../data/repositories/sidebar_repository.dart';
import '../../../../core/router/app_routes.dart';

abstract class ShellState {}

class ShellInitial extends ShellState {}

class ShellLoading extends ShellState {}

class ShellLoaded extends ShellState {
  final List<SidebarLink> links;
  ShellLoaded(this.links);
}

class ShellCubit extends Cubit<ShellState> {
  final SidebarRepository _repository;

  ShellCubit(this._repository) : super(ShellInitial());

  Future<void> loadLinks() async {
    emit(ShellLoading());
    try {
      final links = await _repository.getLinks();
      if (links.isEmpty) {
        // Initial default links if storage is empty
        final defaultLinks = [
          const SidebarLink(id: '1', title: 'Roadmap', path: AppRoutes.roadmap, emoji: '🗺️'),
          const SidebarLink(id: '2', title: 'Books', path: AppRoutes.books, emoji: '📚'),
          const SidebarLink(id: '3', title: 'Stand Out', path: AppRoutes.tips, emoji: '💡'),
          const SidebarLink(id: '4', title: 'Problems', path: AppRoutes.problems, emoji: '🔧'),
          const SidebarLink(id: '5', title: 'Notes', path: AppRoutes.notes, emoji: '📝'),
          const SidebarLink(id: '6', title: 'CV Compare', path: AppRoutes.cvCompare, emoji: '📊'),
        ];
        await _repository.saveLinks(defaultLinks);
        emit(ShellLoaded(defaultLinks));
      } else {
        emit(ShellLoaded(links));
      }
    } catch (e) {
      emit(ShellLoaded([]));
    }
  }
}
