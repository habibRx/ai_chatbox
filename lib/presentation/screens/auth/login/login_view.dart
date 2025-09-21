library login;

import 'package:ed_chat/core/common/wrappers/auth_view_wrapper.dart';
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:ed_chat/presentation/screens/auth/login/components/social_auth.dart';
import 'package:ed_chat/router/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/app_theme/app_constants.dart';
import '../../../../core/app_theme/app_text_styles.dart';
import '../../../../core/app_theme/sizes.dart';
import '../../../../core/common/buttons/elevated_button.dart';
import '../../../../core/common/inputs/text_field_input.dart';
import '../../../../core/config/mixins/validation_mixin.dart';
import '../../../bloc/cubit/user_cubit/user_cubit.dart';

part './constants/strings.dart';
part 'components/form_header_text.dart';
part 'components/login_form.dart';
part 'components/login_with_password_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                FormHeaderText(),
                SizedBox(height: AppSizes.size40),
                LoginForm(),
                SizedBox(height: AppSizes.size45),
                SocialAuth()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
