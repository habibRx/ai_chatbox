
import 'package:fast_pbn/presentation/screens/splash/splash_view.dart';
import 'package:fast_pbn/router/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../config/app_config.dart';
import '../../../presentation/screens/onboarding/onboarding_view.dart';
import '../../app_router.dart';



class Onboarding {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: DashStitchRoutes.splash,

      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child:  SplashView(),
          state: state,
        );
      },
    ),


    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: DashStitchRoutes.onBoarding,
      redirect: (_, state) {
        if (AppConfig.finishedOnboarding) {
          return DashStitchRoutes.login;
        }
        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const OnBoardingView(),
          state: state,
        );
      },
    ),



  ];
}
