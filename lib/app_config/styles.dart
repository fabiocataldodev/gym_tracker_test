import 'package:flutter/material.dart';
import 'package:gym_tracker_test/app_config/app_colors.dart';

class ButtonStyles {
  static ButtonStyle primaryButtonStyle() {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      foregroundColor: WidgetStateProperty.all(AppColors.secondaryColor),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

InputDecoration customInputDecoration({
  String? labelText,
  String? hintText,
}) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    labelStyle: const TextStyle(color: Colors.grey),
    floatingLabelStyle: const TextStyle(color: AppColors.primaryColor),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}
