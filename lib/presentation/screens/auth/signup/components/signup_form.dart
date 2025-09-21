part of '../signup_view.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  static final GlobalKey<SignupFormState> signupFormKey = GlobalKey<SignupFormState>();

  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> with ValidationMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _emailOtpController;
  late final TextEditingController _passwordController;

  bool isOtpStep = false;
  String generatedEmailOtp = '';
  File? _profileImage;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailOtpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailOtpController.dispose();
    super.dispose();
  }

  String _generateEmailOtp({int length = 6}) {
    final rand = Random.secure();
    return List.generate(length, (_) => rand.nextInt(10)).join();
  }

  Future<void> _sendEmailOtp() async {
    generatedEmailOtp = _generateEmailOtp();

    context.read<LoadingCubit>().loading(
      useFan: true
    );
    await _firestore.collection('emailOtps').doc(_emailController.text).set({
      'otp': generatedEmailOtp,
      'timestamp': FieldValue.serverTimestamp(),
    });
    context.read<LoadingCubit>().loaded();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:  Text( "Your OTP is $generatedEmailOtp",
        ),
        action: SnackBarAction(
          label: 'COPY',
          textColor: context.colorScheme.surface,
          onPressed: () {
            Clipboard.setData(ClipboardData(text: generatedEmailOtp));
          },
        ),
      ),
    );


  }

  Future<void> _pickProfileImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _profileImage = File(picked.path);
      });
    }
  }

  Future<void> _handleInitialSignup() async {
    if (!_formKey.currentState!.validate()) return;

    await _sendEmailOtp();

    setState(() {
      isOtpStep = true;
    });
  }

  Future<void> _verifyAndCreateUser() async {
    final doc = await _firestore
        .collection('emailOtps')
        .doc(_emailController.text)
        .get();

    if (!doc.exists || doc['otp'] != _emailOtpController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid Email OTP")),
      );
      return;
    }

    if (_profileImage ==null) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: context.colorScheme.onError,
          content: Text("Select Profile Image to Proceed",
          style: TextStyle(
            color: context.colorScheme.error
          ),),
        ),
      );
    }
    final response = await context.read<UserCubit>().createUserAccount(
      email: _emailController.text,
      password: _passwordController.text,
      fullName: _fullNameController.text,
      imageFile: _profileImage!,
    );


    if (response.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.error!)),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("User created successfully! Login with Credential")),
    );



    context.push(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: isOtpStep ? _otpStepWidgets : _initialSignupWidgets,
        ),
      ),
    );
  }

  List<Widget> get _initialSignupWidgets {
    return [
      AppTextField.withColor(
        prefixIcon : Icon(Icons.person_outline_sharp,
        ),
        backgroundColor: context.colorScheme.surface,
        textInputAction: TextInputAction.next,
        validator: validateRequired,
        hintText: "Enter your full name",
        controller: _fullNameController,
      ),
      const SizedBox(height: 20),
      AppTextField.withColor(
        prefixIcon : Icon(Icons.email_outlined,
        ),
        backgroundColor: context.colorScheme.surface,
        autofillHints: const [AutofillHints.email],
        textInputAction: TextInputAction.done,
        validator: validateEmail,
        hintText: "Enter your email",
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
      ),
      const SizedBox(height: 20),

      // AppTextField.password(
      //   prefixIcon : Icon(Icons.lock_outline,
      //   ),
      //   backgroundColor: context.colorScheme.surface,
      //   autofillHints: const [AutofillHints.email],
      //   textInputAction: TextInputAction.next,
      //   validator: validatePassword,
      //   hintText: "Password",
      //   controller: _passwordController,
      // ),

      const SizedBox(height: 20),

      AppElevatedButton(
        backgroundColor: context.colorScheme.onSurface,
        onPressed: _handleInitialSignup,
        title: "Register",
      ),
    ];
  }

  List<Widget> get _otpStepWidgets {
    return [
      GestureDetector(
        onTap: _pickProfileImage,
        child:Align(
          alignment: Alignment.center, // or Alignment.centerLeft if you want left align
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: ClipOval(
              child: _profileImage != null
                  ? Image.file(
                _profileImage!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              )
                  : const Icon(Icons.add_a_photo),
            ),
          ),
        ),


      ),
      const SizedBox(height: 20),
      AppTextField(
        fieldTitle: "Email OTP",
        textInputAction: TextInputAction.next,
        validator: validateRequired,
        hintText: "Enter email OTP",
        keyboardType: TextInputType.number,
        controller: _emailOtpController,
      ),
      const SizedBox(height: 20),
      AppTextField.password(
        controller: _passwordController,
        hintText: "Enter your password",
        textInputAction: TextInputAction.done,
        validator: validateRequired,
      ),
      const SizedBox(height: 20),
      AppElevatedButton(
        onPressed: _verifyAndCreateUser,
        title: "Verify & Create Account",
      ),
    ];
  }
}


