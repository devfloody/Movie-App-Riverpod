import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/routers/routers.dart';
import '../../../../core/shared/extentions/widget_extention.dart';
import '../../../../core/shared/shared.dart';
import '../../../../core/themes/app_theme.dart';

class DiscoverMoviePage extends ConsumerWidget {
  const DiscoverMoviePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                "Find Movies, Tv series, and more..",
                style: AppFont.plusJakartaMedium.copyWith(
                  fontSize: 24.h,
                  color: AppColor.primayTextColor,
                ),
              ).sidePadding(bottom: 20),
            ),
            SliverToBoxAdapter(
              child: InputField(
                hintText: 'Sherlock Holmes',
                onTap: () => ref.read(goRouterProvider).push(GoRoutePath.search),
              ),
            ),
          ],
        ).defaultPadding(vertical: 36, horizontal: 24),
      ),
    );
  }
}
