import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:ed_chat/core/constants/extensions/widget.dart';
import 'package:ed_chat/presentation/screens/home/landing_page/components/text_header.dart';
import 'package:ed_chat/presentation/widget/send_message/send_message.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_constants.dart';
import 'components/chat_info_tiles.dart';

class HomeLandingView extends StatelessWidget {
  const HomeLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          // horizontal: AppConstants.viewPaddingHorizontal,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextHeader(),

            SizedBox(height: 40,),

            RulesSection(),

            SendMessageBox()
          ],
        ).withContentPadded,
      ),
    );
  }
}
