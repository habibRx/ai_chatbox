import 'package:ed_chat/presentation/screens/home/get_started/get_started_view.dart';
import 'package:ed_chat/presentation/screens/home/landing_page/home_landing_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/mixins/authenticaiton_mixin.dart';
import '../../app_router.dart';
import '../../app_routes.dart';

class Home with FirebaseAuthenticationMixin {
  static final routes = [
    GoRoute(
      path: AppRoutes.home,
      parentNavigatorKey: AppRouter.homeNavigatorKey,
      redirect: (context, state) {
        if (FirebaseAuthenticationMixin.shouldAuthenticateUser(context)) {
          return AppRoutes.login;
        }

        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: HomeLandingView(),
          state: state,
        );
      },
    ),


    GoRoute(
      path: AppRoutes.homeOnboard,
      parentNavigatorKey: AppRouter.homeNavigatorKey,
      redirect: (context, state) {
        if (FirebaseAuthenticationMixin.shouldAuthenticateUser(context)) {
          return AppRoutes.login;
        }

        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: GetStartedView(),
          state: state,
        );
      },
    ),


  ];
}
