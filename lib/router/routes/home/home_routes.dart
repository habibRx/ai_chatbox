


import 'package:fast_pbn/config/mixins/authenticaiton_mixin.dart';
import 'package:fast_pbn/presentation/screens/home/home_screen_view.dart';
import 'package:fast_pbn/router/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../app_router.dart';

class Home with FirebaseAuthenticationMixin {
  static final routes = [
    GoRoute(
      path: DashStitchRoutes.home,
      parentNavigatorKey: AppRouter.homeNavigatorKey,
      redirect: (context, state) {
        if (FirebaseAuthenticationMixin.shouldAuthenticateUser(context)) {
          return DashStitchRoutes.login;
        }

        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: HomeScreenView(),
          state: state,
        );
      },
    ),

  ];
}
