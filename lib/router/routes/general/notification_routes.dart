import 'package:fast_pbn/presentation/screens/notification/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/mixins/authenticaiton_mixin.dart';
import '../../app_router.dart';
import '../../app_routes.dart';


class NotificationR with FirebaseAuthenticationMixin {
  static final routes = [
    GoRoute(
      path: DashStitchRoutes.notifcation,
      parentNavigatorKey: AppRouter.parentNavigatorKey,
      redirect: (context, state) {
        if (FirebaseAuthenticationMixin.shouldAuthenticateUser(context)) {
          return DashStitchRoutes.login;
        }

        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: NotificationsPage(),
          state: state,
        );
      },
    ),

  ];
}
