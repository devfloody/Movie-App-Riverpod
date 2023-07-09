import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/shared/extentions/widget_extention.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Assets.images.logo.image(height: 100),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Now Playing Movies",
                        style: AppFont.plusJakartaSemibold.copyWith(fontSize: 20.sp, color: AppColor.primayTextColor),
                      ).horizontalPadding(padding: 16),
                      8.verticalSpace,
                      const NowPlayingMovieCarouselWidget(),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Popular Movies",
                        style: AppFont.plusJakartaSemibold.copyWith(fontSize: 20.sp, color: AppColor.primayTextColor),
                      ).horizontalPadding(padding: 16),
                      8.verticalSpace,
                      const PopularMovieCarouselWidget(),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Upcoming Movies",
                        style: AppFont.plusJakartaSemibold.copyWith(fontSize: 20.sp, color: AppColor.primayTextColor),
                      ).horizontalPadding(padding: 16),
                      8.verticalSpace,
                      const UpcomingMovieCarouselWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
