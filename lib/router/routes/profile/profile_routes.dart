import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../core/config/mixins/authenticaiton_mixin.dart';
import '../../app_router.dart';
import '../../app_routes.dart';

class Profile with FirebaseAuthenticationMixin {
  static final routes = [
    GoRoute(
      path: AppRoutes.profile,
      parentNavigatorKey: AppRouter.profileNavigatorKey,
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


    GoRoute(
      path: AppRoutes.profileAddress,
      parentNavigatorKey: AppRouter.profileNavigatorKey,
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
