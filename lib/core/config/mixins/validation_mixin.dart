mixin ValidationMixin {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address.';
    }

    if (value.length > 32) {
      return 'Email should be maximum 32 characters.';
    }

    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'required';
    }
    return null;
  }

  String? validateDOB(DateTime? dob) {
    if (dob == null) {
      return 'Date of birth is required';
    }

    final currentDate = DateTime.now();
    final age = currentDate.year - dob.year;
    final isBeforeBirthdayThisYear = currentDate.month < dob.month ||
        (currentDate.month == dob.month && currentDate.day < dob.day);

    if (age < 21 || (age == 21 && isBeforeBirthdayThisYear)) {
      return 'Minimum age is 21yrs';
    }

    return null;
  }

  String? validateDateRange(String? startDateStr, String? endDateStr) {
    if (startDateStr == null || startDateStr.isEmpty) {
      return 'Start date is required';
    }
    if (endDateStr == null || endDateStr.isEmpty) {
      return 'End date is required';
    }

    DateTime? startDate = DateTime.tryParse(startDateStr);
    DateTime? endDate = DateTime.tryParse(endDateStr);

    if (startDate == null) {
      return 'Invalid start date format';
    }
    if (endDate == null) {
      return 'Invalid end date format';
    }

    DateTime today = DateTime.now();

    if (!endDate.isAfter(startDate)) {
      return 'End date must be after start date';
    }

    if (!endDate.isAfter(today)) {
      return 'End date must be after today';
    }

    return null;
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'required';
    }

    final parsedValue = num.tryParse(value);
    if (parsedValue == null) {
      return 'must be a valid number';
    }

    return null;
  }

  String? validateRequiredWithOne(String? value) {
    if (value == null || value.isEmpty) {
      return 'required';
    }
    if (value.length <= 1) {
      return 'must be greater than 1 character';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

  String? validatePasswordConfirm(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateYear(String? input) {
    if (input == null || input.isEmpty) {
      return 'required';
    }
    RegExp regex = RegExp(r'^\d{4}$');
    if (regex.hasMatch(input)) {
      return null;
    }
    return "Invalid date";
  }

  String? validateMMYYYYWithCurrentDate(String? input) {
    if (input == null || input.isEmpty) {
      return 'Required';
    }

    final currentDate = DateTime.now();

    RegExp regex = RegExp(r'^\d{2}/\d{4}$');
    if (!regex.hasMatch(input)) {
      return 'Invalid format, please use "mm/yyyy"';
    }

    List<String> parts = input.split('/');
    int month = int.tryParse(parts[0]) ?? 0;
    int year = int.tryParse(parts[1]) ?? 0;

    if (month < 1 || month > 12) {
      return 'Invalid month';
    }

    if (year < currentDate.year ||
        (year == currentDate.year && month < currentDate.month)) {
      return 'Date cannot be in the past';
    }

    return null;
  }

  String? validateGreaterThan(String? min, String? max) {
    final minValue = int.tryParse(min ?? '');
    final maxValue = int.tryParse(max ?? '');

    if (minValue != null && maxValue != null && minValue > maxValue) {
      return 'Max >= Min';
    }
    return null;
  }

  String? validateLessThan(String? min, String? max) {
    final minValue = int.tryParse(min ?? '');
    final maxValue = int.tryParse(max ?? '');

    if (minValue != null && maxValue != null && minValue > maxValue) {
      return 'Min <= Max';
    }
    return null;
  }

  String? validateEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName.';
    }
    return null;
  }

  // String? validatePhoneNumber(String? input) {
  //   if (input == null || input.isEmpty) {
  //     return 'required';
  //   }

  //   RegExp phoneNumberRegExp = RegExp(
  //     r'^\d{10}$',
  //     caseSensitive: false,
  //     multiLine: false,
  //   );

  //   if (!phoneNumberRegExp.hasMatch(input.replaceAll(RegExp(r'[-()\s]'), ''))) {
  //     return 'Invalid phone number';
  //   }

  //   return null;
  // }

  String? validatePhoneNumber(String? input) {
    if (input == null || input.isEmpty) {
      return 'Phone number is required';
    }

    RegExp phoneNumberRegExp = RegExp(
      r'^\d{3}-\d{3}-\d{4}$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!phoneNumberRegExp.hasMatch(input)) {
      return 'Invalid phone number format (xxx-xxx-xxxx)';
    }

    return null;
  }
}
