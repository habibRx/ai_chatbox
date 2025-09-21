
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:flutter/material.dart';
import '../../app_theme/app_constants.dart';
import '../../app_theme/app_text_styles.dart';

class AppDropDownTextField<T> extends StatefulWidget {
  final TextEditingController controller;
  final List<T> items;
  final String? Function(T?)? validator;
  final String hintText;
  final String labelText;
  final T? initialValue;
  final void Function(T?)? onChanged;
  final bool isRequired;
  final bool isDisabled;
  final Color? backgroundColor;

  const AppDropDownTextField({
    Key? key,
    required this.controller,
    required this.items,
    this.validator,
    required this.hintText,
    required this.labelText,
    this.initialValue,
    this.onChanged,
    this.isRequired = false,
    this.backgroundColor,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  AppDropDownTextFieldState<T> createState() => AppDropDownTextFieldState<T>();
}

class AppDropDownTextFieldState<T> extends State<AppDropDownTextField<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
    if (selectedValue != null) {
      widget.controller.text = selectedValue.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      enableFeedback: true,
      style: const TextStyle().copyWith(
          fontSize: AppTextStyles.inputTextStyle.fontSize, color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        contentPadding: AppConstants.contentPadding,
        hintText: widget.hintText,
        fillColor: widget.backgroundColor ?? context.colorScheme.secondary,
        labelText: widget.labelText,
        errorBorder: const OutlineInputBorder(),
        focusedErrorBorder: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        focusedBorder: const OutlineInputBorder(),
      ),
      value: selectedValue,
      items: widget.items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString().substring(0, 1).toUpperCase() +
              value.toString().substring(1)),
        );
      }).toList(),
      onChanged: (T? newValue) {
        setState(() {
          selectedValue = newValue;
          widget.controller.text = newValue.toString().trim();
        });
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
      validator: widget.validator,
    );
  }
}
