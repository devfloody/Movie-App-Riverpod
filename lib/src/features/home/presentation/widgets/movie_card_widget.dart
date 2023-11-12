import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_movie_riverpod/gen/assets.gen.dart';
import 'package:new_movie_riverpod/src/core/constants/api_constant.dart';
import 'package:new_movie_riverpod/src/features/home/domain/movie_model.dart';

import '../../../../core/themes/app_theme.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150.w,
          height: 240.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          child: Stack(
            children: [
              SizedBox(
                width: 150.w,
                height: 240.h,
                child: CachedNetworkImage(
                  imageUrl: "${ApiConstant.imageUrlOriginal}${movie.posterPath}",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Assets.animations.loading.lottie(),
                  errorWidget: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image_outlined),
                    );
                  },
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      height: 38.h,
                      width: 50.w,
                      decoration: const BoxDecoration(color: Colors.black12),
                      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 6.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IMDb',
                            style: AppFont.plusJakartaRegular.copyWith(
                              color: AppColor.primayTextColor,
                              fontSize: 8.sp,
                            ),
                          ),
                          2.verticalSpace,
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColor.favColor,
                                size: 14.sp,
                              ), 
                              4.horizontalSpace,
                              Text(
                                movie.voteAverage?.toStringAsFixed(1) ?? '',
                                style: AppFont.plusJakartaRegular.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColor.primayTextColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        8.verticalSpace,
        Text(
          movie.title ?? '',
          textAlign: TextAlign.center,
          style: AppFont.plusJakartaMedium.copyWith(
            color: AppColor.primayTextColor,
            fontSize: 12.sp,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
