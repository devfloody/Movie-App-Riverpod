import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_movie_riverpod/gen/assets.gen.dart';
import 'package:new_movie_riverpod/src/core/themes/app_theme.dart';

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
                        Container(
                          width: 150.w,
                          height: 240.h,
                          decoration: BoxDecoration(
                            color: AppColor.primayTextColor,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Stack(
                            children: [
                              const Center(
                                child: Text('Ini Background'),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 28.33,
                                      sigmaY: 28.33,
                                    ),
                                    child: Container(
                                      color: Colors.blue,
                                      height: 24.h,
                                      width: 40.w,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
