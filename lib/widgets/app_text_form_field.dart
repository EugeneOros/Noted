import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? labelText;
  final double borderRadius;
  final bool obscureText;
  final double? width;
  final double? height;
  final int? maxLength;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Color? fillColor;
  final ValueChanged<String>? onFieldSubmitted;

  const AppTextFormField({
    Key? key,
    this.labelText,
    this.borderRadius = 50,
    this.obscureText = false,
    this.controller,
    this.width,
    this.height,
    this.maxLength, this.validator,
    this.fillColor,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        cursorColor: Colors.black12,
        obscureText: obscureText,
        controller: controller,
        maxLength: maxLength,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.subtitle1,
          alignLabelWithHint: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
          fillColor: fillColor ?? Colors.white,
        ),
      ),
    );
  }
}
