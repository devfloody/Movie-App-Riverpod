import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/themes/app_theme.dart';
import '../widgets/popular_movie_carousel_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.w),
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
                          "Popular Movie",
                          style: AppFont.plusJakartaMedium.copyWith(fontSize: 20.sp, color: AppColor.primayTextColor),
                        ),
                        8.verticalSpace,
                        const PopularMovieCarouselWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
