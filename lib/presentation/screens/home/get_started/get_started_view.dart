import 'package:ed_chat/core/app_theme/app_text_styles.dart';
import 'package:ed_chat/core/common/buttons/elevated_button.dart';
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:ed_chat/core/constants/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../router/app_routes.dart';


class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat,
              size: context.viewSize.height*.25,
            ),

            Align(
              alignment: AlignmentGeometry.center,
              child: Text("Welcome to EDU-Chat",
              style: AppTextStyles.authSectionHeader2TextStyle.copyWith(
                color: context.colorScheme.onSurface
              ),),
            ),

            Align(
              alignment: AlignmentGeometry.center,
              child: SizedBox(width: context.viewSize.width*.75,
              child: Text("Start chatting with your personal AI Chatbot Enhance Studies",
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium!.copyWith(
                      color: AppColors.lowOpacityTextColor
                  )),),
            ),

            SizedBox(height: context.viewSize.height*.10,),

         Row(
           children: [
             Flexible(
                 fit: FlexFit.tight,
                 child:  AppElevatedButton(title: "Get Started",
                   onPressed: (){
                   context.pushReplacement(AppRoutes.home);
                   },
                   backgroundColor: context.colorScheme.onSurface,))
           ],
         ).withHorViewPadding

          ],
        ),
      ),
    );
  }
}
