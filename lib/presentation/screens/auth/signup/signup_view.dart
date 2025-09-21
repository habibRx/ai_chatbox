library signup;

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:ed_chat/router/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/app_constants.dart';
import '../../../../core/app_theme/app_text_styles.dart';
import '../../../../core/app_theme/sizes.dart';
import '../../../../core/common/buttons/elevated_button.dart';
import '../../../../core/common/inputs/text_field_input.dart';
import '../../../../core/common/wrappers/auth_view_wrapper.dart';
import '../../../../core/config/mixins/validation_mixin.dart';
import '../../../bloc/cubit/loading_cubit/loading_cubit.dart';
import '../../../bloc/cubit/user_cubit/user_cubit.dart';
import 'components/social_auth.dart';

part 'components/form_header_text.dart';
part 'components/signup_form.dart';
part 'constants/strings.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthViewWrapper(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.viewPaddingHorizontal,
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppConstants.authenticationMaxWidth,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                const FormHeaderText(),
                const SizedBox(height: AppSizes.size40),
                const SignupForm(),

                const SizedBox(height: AppSizes.size10),

                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: context.textTheme.titleSmall!.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: GoogleFonts.teko(
                            textStyle: context.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push("/login");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.size45),
                SocialAuth(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
