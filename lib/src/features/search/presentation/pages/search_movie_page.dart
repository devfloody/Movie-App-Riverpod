import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

import '../../../../core/constants/api_constant.dart';
import '../../../../core/shared/extentions/widget_extention.dart';
import '../../../../core/shared/shared.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../home/domain/movie_model.dart';
import '../providers/search_movie_notifier.dart';

class SearchMoviePage extends HookConsumerWidget {
  const SearchMoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const InputField(hintText: 'Find Your Movies ...'),
            20.verticalSpace,
            Expanded(
              child: RiverPagedBuilder<int, Movie>(
                provider: searchMovieNotifierProvider,
                noItemsFoundIndicatorBuilder: (context, controller) {
                  return Text(
                    "Belum ada data film",
                    style: AppFont.plusJakartaMedium.copyWith(
                      color: AppColor.primayTextColor,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ).verticalPadding(padding: 16);
                },
                itemBuilder: (context, item, index) {
                  return Container(
                    height: 100.h,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColor.surfaceColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 80.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColor.primayTextColor,
                          ),
                          child: item.posterPath != null
                              ? Image.network(
                                  "${ApiConstant.imageUrlSmall}${item.posterPath}",
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text(error.toString());
                                  },
                                )
                              : const Icon(IconlyLight.image),
                        ),
                        SizedBox(
                          width: 24.w,
                          child: const VerticalDivider(
                            indent: 8,
                            endIndent: 8,
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title ?? '-',
                                style: AppFont.plusJakartaMedium.copyWith(
                                  color: AppColor.primayTextColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              4.verticalSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    IconlyBold.star,
                                    color: Colors.amber,
                                    size: 16.sp,
                                  ),
                                  2.horizontalSpace,
                                  Text(
                                    item.voteAverage?.toStringAsFixed(1) ?? '-',
                                    style: AppFont.plusJakartaMedium.copyWith(
                                      color: AppColor.primayTextColor,
                                      fontSize: 14.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              12.verticalSpace,
                              Text(
                                item.overview ?? '-',
                                style: AppFont.plusJakartaLight.copyWith(
                                  color: AppColor.primayTextColor,
                                  fontSize: 14.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                firstPageKey: 1,
                pagedBuilder: (controller, builder) {
                  return PagedListView.separated(
                    pagingController: controller,
                    builderDelegate: builder,
                    separatorBuilder: (context, index) => 8.verticalSpace,
                  );
                },
              ),
            ),
          ],
        ).defaultPadding(vertical: 36, horizontal: 24),
      ),
    );
  }
}
