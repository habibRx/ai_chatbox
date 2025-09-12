import 'dart:math';

import 'package:flutter/material.dart';

import '../../app_theme/app_constants.dart';
import '../../app_theme/sizes.dart';


extension AddWalletBottomSheet on Widget {



  Future<T?> asDialog<T>(BuildContext context,
      {String? title, void Function()? onClose, bool isDismissible = true}) {
    return showDialog<T>(
        context: context, builder: (BuildContext context) => this);
  }

  Widget get withHorViewPadding {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.viewPaddingHorizontal),
      child: this,
    );
  }

  Widget get withVertViewPadding {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppConstants.viewPaddingVertical),
      child: this,
    );
  }

  Widget get withSmallVertPadding {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppConstants.smallPaddingVertical),
      child: this,
    );
  }
  Widget get withViewPadding {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.viewPaddingHorizontal,
          vertical: AppConstants.viewPaddingVertical),
      child: this,
    );
  }

  Widget get withContentPadded {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.size10, vertical: AppSizes.size12),
      child: this,
    );
  }

  Widget get visualize {
    return Container(
      color: Colors
          .primaries[Random().nextInt(Colors.primaries.length)],
      child: this,
    );
  }
}
