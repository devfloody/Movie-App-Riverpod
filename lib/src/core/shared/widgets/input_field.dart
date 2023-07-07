part of '../shared.dart';

class InputField extends HookConsumerWidget {
  const InputField({
    super.key,
    this.onTap,
    this.keyboardType,
    required this.hintText,
  });

  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();

    return TextField(
      controller: controller,
      style: AppFont.plusJakartaMedium.copyWith(
        fontSize: 14.sp,
        color: AppColor.primayTextColor,
      ),
      onTap: () => onTap?.call(),
      keyboardType: onTap != null ? TextInputType.none : keyboardType,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12.w),
        fillColor: AppColor.surfaceColor,
        filled: true,
        hintText: hintText,
        hintStyle: AppFont.plusJakartaMedium.copyWith(
          color: AppColor.secondaryTextColor,
          fontSize: 14.sp,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.r),
        ),
        prefixIcon: Icon(
          IconlyLight.search,
          size: 24.sp,
          color: AppColor.primayTextColor,
        ),
      ),
      onSubmitted: (value) => ref.read(queryProvider.notifier).state = value,
    );
  }
}
