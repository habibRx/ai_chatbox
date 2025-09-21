import 'package:ed_chat/core/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,
      child: Text("Educhat",
      style: AppTextStyles.authSectionHeaderTextStyle,),
    );
  }
}
