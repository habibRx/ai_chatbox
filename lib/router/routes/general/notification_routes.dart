import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/config/mixins/authenticaiton_mixin.dart';
import '../../app_router.dart';
import '../../app_routes.dart';


class NotificationR with FirebaseAuthenticationMixin {
  static final routes = [
    GoRoute(
      path: AppRoutes.notifcation,
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      redirect: (context, state) {
        if (FirebaseAuthenticationMixin.shouldAuthenticateUser(context)) {
          return AppRoutes.login;
        }

        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: Center(),
          state: state,
        );
      },
    ),

  ];
}
