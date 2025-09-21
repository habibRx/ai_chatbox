part of '../login_view.dart';

class FormHeaderText extends StatelessWidget {
  const FormHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Text(
        Strings.signInText,
        style: GoogleFonts.poppins(
          textStyle: AppTextStyles.authSectionHeaderTextStyle.copyWith(
              color: context.colorScheme.onSurface
          ),
        ),          ),
    );
  }
}
