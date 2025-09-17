import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../presentation/screens/onboarding/onboarding_view.dart';
import '../../app_router.dart';
import '../../app_routes.dart';

class Auth {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.login,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child:  OnBoardingView(),
          state: state,
        );
      },
    ),


    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.signUp,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: Center(),
          state: state,
        );
      },
    ),


    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.forgetPassword,
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: Center(),
          state: state,
        );
      },
    ),

  ];
}
