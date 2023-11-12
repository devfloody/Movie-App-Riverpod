import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_movie_riverpod/src/core/themes/app_theme.dart';
import 'package:new_movie_riverpod/src/features/home/domain/movie_model.dart';
import 'package:new_movie_riverpod/src/features/home/presentation/providers/popular_movies_notifier.dart';

import '../../../../../gen/assets.gen.dart';

class MovieStaggeredWidget extends HookConsumerWidget {
  const MovieStaggeredWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMovie = ref.watch(popularMoviesProvider);
    return popularMovie.when(
      data: (data) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: StaggeredGrid.count(
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            children: data
                .asMap()
                .entries
                .map(
                  (e) => StaggeredGridTile.count(
                    crossAxisCellCount: (e.key + 1) % 5 == 0 ? 2 : 1,
                    mainAxisCellCount: (e.key + 1) % 5 == 0 ? 1 : 1.5,
                    child: CustomStaggeredCard(
                      data: e.value,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
      error: (error, stackTrace) => Container(child: Assets.svg.notFound.svg()),
      loading: () => Center(child: Assets.animations.loading.lottie()),
    );
  }
}

class CustomStaggeredCard extends StatelessWidget {
  const CustomStaggeredCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Movie data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primayTextColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            data.title ?? "",
            style: AppFont.plusJakartaMedium.copyWith(
              fontSize: 12.sp,
              color: AppColor.primaryColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
