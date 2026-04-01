import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import '../../../../core/common_widgets/app_progress_bar.dart';
import '../../../../core/constants/app_constants.dart';
import '../cubit/roadmap_cubit.dart';
import '../widgets/section_card.dart';

class RoadmapPage extends StatelessWidget {
  const RoadmapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RoadmapCubit>()..loadRoadmap(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<RoadmapCubit, RoadmapState>(
          builder: (context, state) {
            if (state is RoadmapLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RoadmapError) {
              return Center(child: Text(state.message));
            }

            if (state is RoadmapLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(LayoutConstants.defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                AppStrings.roadmapProgressLabel,
                                style: context.typography.font16W700Color,
                              ),
                              const Spacer(),
                              Text(
                                "${(state.overallProgress * 100).toInt()}%",
                                style: context.typography.font16W700Color.copyWith(
                                  color: context.colors.accent,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          AppProgressBar(progress: state.overallProgress),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: LayoutConstants.defaultPadding),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: context.isMobile ? 1 : 2,
                        crossAxisSpacing: LayoutConstants.gridSpacing,
                        mainAxisSpacing: LayoutConstants.gridSpacing,
                        mainAxisExtent: LayoutConstants.roadmapCardExtent,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final section = state.sections[index];
                          return SectionCard(
                            section: section,
                            onToggleItem: (secId, itemId) {
                              context.read<RoadmapCubit>().toggleItem(secId, itemId);
                            },
                          );
                        },
                        childCount: state.sections.length,
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
