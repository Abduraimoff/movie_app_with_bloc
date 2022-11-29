import 'package:flutter/services.dart';
import 'package:movie_app/utils/export_pack.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? preffix;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool? autoFocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final int? maxLenght;
  final String? errorText;
  final EdgeInsets? contentPadding;

  const CustomTextField({
    Key? key,
    this.controller,
    this.suffix,
    this.preffix,
    this.hintText,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.validator,
    this.onChanged,
    this.autoFocus = false,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.done,
    this.maxLenght,
    this.errorText,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final white60 = Colors.white.withOpacity(0.6);
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      maxLength: maxLenght,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofocus: autoFocus!,
      maxLines: maxLines,
      minLines: minLines,
      cursorColor: white60,
      cursorWidth: 1,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: white60,
      ),
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 8.w,
            ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.12),
        errorText: errorText,
        hintText: hintText,
        prefixIcon: preffix,
        prefixIconConstraints: BoxConstraints(
          minWidth: 10.w,
          minHeight: 0,
        ),
        suffixIcon: suffix,
        hintStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: white60,
        ),
        errorStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: Colors.red,
        ),
        errorMaxLines: 1,
        isCollapsed: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
