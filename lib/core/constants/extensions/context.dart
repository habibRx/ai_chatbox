
import 'package:flutter/material.dart';

import '../../utils/enums.dart';

extension BuildContextExtention on BuildContext {
  void showSnackBar(message,
      [BarType snackBarType = BarType.success, SnackBarAction? action]) {
    if (mounted) {
      ScaffoldMessenger.of(this).removeCurrentSnackBar();
      switch (snackBarType) {
        case BarType.error:
          ScaffoldMessenger.of(this).showSnackBar(errorSnackBar(message));
          break;
        case BarType.success:
          ScaffoldMessenger.of(this).showSnackBar(successSnackBar(message));
          break;
        case BarType.loading:
          ScaffoldMessenger.of(this).showSnackBar(loadingSnackBar(message, null));
          break;
        case BarType.action:
          ScaffoldMessenger.of(this).showSnackBar(actionSnackBar(message, action));
          break;
      }
    }
  }


  // void showBanner(String data, List<Widget> actions) {
  //   var scaffoldMessenger =
  //       ScaffoldMessenger.of(read<AppScaffoldController>().key.currentContext!);
  //   scaffoldMessenger.removeCurrentMaterialBanner();
  //   scaffoldMessenger.showMaterialBanner(informationBanner(data, actions));
  // }

  /// Retrieve the current theme data from the context.
  ///
  /// Usage:
  /// ```dart
  /// ColorScheme colorScheme = context.colorScheme;
  /// ```
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Retrieve the current theme data from the context.˚
  ///
  /// Usage:
  /// ```dart
  /// ThemeData colorScheme = context.colorScheme;
  /// ```
  ThemeData get theme => Theme.of(this);

  /// Retrieve the current text theme from the context.
  ///
  /// Usage:
  /// ```dart
  /// ColorScheme colorScheme = context.theme;
  /// ```
  TextTheme get textTheme => Theme.of(this).textTheme;

  dynamic get focus => FocusScope.of(this).nextFocus();
  dynamic get removeFocus => FocusScope.of(this).unfocus();

  Size get viewSize => MediaQuery.of(this).size;

  double get bottomViewPadding => MediaQuery.of(this).viewPadding.bottom;

  SnackBar successSnackBar(String message) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      duration: const Duration(seconds: 2),
    );
  }

  SnackBar errorSnackBar(String message) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      duration: const Duration(seconds: 3),
    );
  }

  SnackBar loadingSnackBar(String message, void Function()? onTap) {
    return SnackBar(
      content: Row(
        children: [
          const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      duration: const Duration(minutes: 1), // Long duration for loading
    );
  }

  SnackBar actionSnackBar(String message, SnackBarAction? action) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      action: action,
      duration: const Duration(seconds: 4),
    );
  }

}
