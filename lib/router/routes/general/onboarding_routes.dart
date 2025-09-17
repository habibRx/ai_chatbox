
import 'package:ed_chat/router/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../core/config/app_config.dart';
import '../../../presentation/screens/onboarding/onboarding_view.dart';
import '../../app_router.dart';



class Onboarding {
  static final routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.splash,

      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child:  OnBoardingView(),
          state: state,
        );
      },
    ),


    GoRoute(
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      path: AppRoutes.onBoarding,
      // redirect: (_, state) {
      //   if (AppConfig.finishedOnboarding) {
      //     return AppRoutes.onBoarding;
      //   }
      //   return null;
      // },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const OnBoardingView(),
          state: state,
        );
      },
    ),



  ];
}
