import 'package:ed_chat/core/app_theme/app_colors.dart';
import 'package:ed_chat/core/app_theme/app_constants.dart';
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:ed_chat/core/constants/extensions/widget.dart';
import 'package:flutter/material.dart';


class RulesSection extends StatelessWidget {
  const RulesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        RuleItem(
          text: 'Remembers what user said earlier in the conversation',
        ),
        RuleItem(
          text: 'Allows user to provide follow-up corrections with AI',
        ),
        RuleItem(
          text: 'Limited knowledge of world and events after 2021',
        ),
        RuleItem(
          text: 'May occasionally generate incorrect information',
        ),
        RuleItem(
          text: 'May occasionally produce harmful instructions or biased content',
        ),
      ],
    );
  }
}

class RuleItem extends StatelessWidget {
  final String text;

  const RuleItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentGeometry.center,
      height: context.viewSize.height*.09,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          color: AppColors.lightPurpleSecondary,
        // border: Border.all(color: Colors.red)
      ),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryLight,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    ).withContentPadded;
  }
}