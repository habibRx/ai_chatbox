
import 'package:fast_pbn/presentation/screens/auth/forget_password/forget_password_view.dart';
import 'package:fast_pbn/presentation/screens/auth/login/login_view.dart';
import 'package:fast_pbn/presentation/screens/auth/signup/signup_view.dart';
import 'package:fast_pbn/router/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../app_router.dart';



class Auth {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: DashStitchRoutes.login,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child:  LoginView(),
          state: state,
        );
      },
    ),


    // GoRoute(
    //   parentNavigatorKey: AppRouter.parentNavigatorKey,
    //   path: DashStitchRoutes.sellerLogin,
    //   pageBuilder: (context, state) {
    //     return AppRouter.setupPage(
    //       child: SellerLoginView(),
    //       state: state,
    //     );
    //   },
    // ),

    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: DashStitchRoutes.signUp,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: SignupView(),
          state: state,
        );
      },
    ),


    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: DashStitchRoutes.forgetPassword,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: ForgetPasswordView(),
          state: state,
        );
      },
    ),

  ];
}
