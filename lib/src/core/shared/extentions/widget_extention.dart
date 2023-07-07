import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [PaddingExtention] digunakan sebagai extention untuk menambahkan padding pada semua widget
extension PaddingExtention on Widget {
  /// Menambahkan padding horizontal
  Widget horizontalPadding({double padding = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: this,
    );
  }

  /// Menambahkan padding vertical
  Widget verticalPadding({double padding = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding.h),
      child: this,
    );
  }

  /// Menambahkan padding horizontal dan vertical
  Widget defaultPadding({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w),
      child: this,
    );
  }

  /// Menambahkan padding pada salah satu sisi
  Widget sidePadding({
    double top = 0,
    double bottom = 0,
    double right = 0,
    double left = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top.h,
        bottom: bottom.h,
        left: left.w,
        right: right.w,
      ),
      child: this,
    );
  }
}
