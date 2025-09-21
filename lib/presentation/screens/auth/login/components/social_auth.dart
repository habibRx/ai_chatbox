import 'package:ed_chat/core/app_theme/app_constants.dart';
import 'package:ed_chat/core/common/buttons/elevated_button.dart';
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_theme/app_colors.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Continue with",
            style: TextStyle(
              color: AppColors.lowOpacityTextColor,
              fontSize: 14,
            ),
          ),
        ),

        SizedBox(height: context.viewSize.height * .01),

        Row(
          children: [
            Expanded(
                child: AppElevatedButton.small(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                    backgroundColor: Colors.red,
                    onPressed: (){},
                    title: "Google")),

            SizedBox(width: 10),

            Expanded(child: AppElevatedButton.small(
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                backgroundColor: Colors.blue,
                onPressed: (){},
                title: "Facebook")),
          ],
        ),
      ],
    );
  }
}
