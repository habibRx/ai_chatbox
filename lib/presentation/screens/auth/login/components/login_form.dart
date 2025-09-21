part of '../login_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  static final GlobalKey<LoginFormState> loginFormKey =
      GlobalKey<LoginFormState>();

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> with ValidationMixin {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool loginWithWallet = true;
  bool hasWalletProvider = false;

  String loginButtonPrompt = Strings.connectWalletButtonText;
  final _formKey = GlobalKey<FormState>();


  void signupPressed() async {
    context.push(AppRoutes.signUp);
  }


  @override
  void initState() {


    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    // if (AppEnvironment.isDevelopment && kDebugMode) {
    //   _emailController.text = "itsAha@gmail.com";
    //   _passwordController.text = "11111111";
    // }

    // changeLoginButtonPrompt();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // changeLoginButtonPrompt();
    super.didChangeDependencies();
  }



  Future<void> _login() async {
    if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.colorScheme.onError,
          content: Text("Kindly fill in credentials",
            style: TextStyle(
                color: context.colorScheme.error
            ),),
        ),
      );
      return;
    }

    final response = await context.read<UserCubit>().login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (response.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.colorScheme.onError,
          content: Text(response.error!,
            style: TextStyle(
                color: context.colorScheme.error
            ),),
        ),
      );    } else {
      context.pushReplacement('/home');
    }
  }


  void onAuthenticationError(String errorMessage, bool isNewUser) async {
    // context.showSnackBar(errorMessage, BarType.error);
    //
    // if (!isNewUser) {
    //   return;
    // }
    // final registerResponse = await (const SignUpApp().asBottomSheet<bool?>(
    //     context,
    //     enableDrag: false,
    //     bottomSafeArea: false,
    //     isDismissible: false));
    // if (registerResponse != null && registerResponse) {
    //   return _onContinueWithWallet();
    // }
  }

  // void onAuthenticated(_, __, ___, bool isEmailVerified, String email) {
  //   Map<String, String> userData = {
  //     "email": email,
  //   };
  //   context.read<DashboardCubit>().getData();
  //   context.read<HostCubit>().getData();
  //   context.read<VehicleCubit>().getAllVehicle();
  //   context.read<WalletCubit>().refreshWallet();
  //   context.read<WalletCubit>().initialize();
  //   !isEmailVerified
  //       ? AppRouter.router.go(AuthRoutes.activateAccount, extra: [userData, true])
  //   : AppRouter.router.go(EcomotoRoutes.home);
  //
  //   // AppRouter.router.go(EcomotoRoutes.home);
  // }


  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
              ..._loginWithPassword
          ],
        ),
      ),
    );
  }


  List<Widget> get _loginWithPassword {
    return [
      AppTextField.withColor(
        backgroundColor: context.colorScheme.surface,
        autofillHints: const [AutofillHints.email],
        textInputAction: TextInputAction.next,
        validator: validateRequired,
        hintText: Strings.emailHintText,
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
      ),
      const SizedBox(height: AppSizes.size20),
      AppTextField.password(
        backgroundColor: context.colorScheme.surface,
        autofillHints: const [AutofillHints.password],
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => _login(),
        validator: validateRequired,
        hintText: Strings.passwordHintText,
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordController,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: (){},
          // onPressed: () {
          //   AppRouter.router.go(AppRoutes.forgetPassword);
          // },
          child: const Text(
            Strings.forgotPasswordText,
          ),
        ),
      ),

      const SizedBox(
        height: AppSizes.size40,
      ),

      AppElevatedButton(
        onPressed: _login,
        backgroundColor: context.colorScheme.onSurface,
        title: Strings.loginText,
      ),

      TextButton(
        onPressed: signupPressed,
        child: RichText(
          text: TextSpan(
            text: "Create New Account? ",
            style:  TextStyle(
              color: AppColors.lowOpacityTextColor, // normal text color
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: "Sign up",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      )
    ];
  }
}
