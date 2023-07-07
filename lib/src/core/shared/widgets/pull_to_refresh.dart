part of '../shared.dart';

class MoviePullToRefresh extends StatelessWidget {
  const MoviePullToRefresh({
    super.key,
    required this.onRefresh,
  });

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      backgroundColor: AppColor.primaryColor,
      color: AppColor.primayTextColor,
      springAnimationDurationInMilliseconds: 500,
      onRefresh: onRefresh,
      child: ListView(),
    );
  }
}
