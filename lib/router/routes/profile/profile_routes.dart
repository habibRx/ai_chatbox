


import 'package:fast_pbn/config/mixins/authenticaiton_mixin.dart';
import 'package:fast_pbn/presentation/screens/profile/profile_view.dart';
import 'package:fast_pbn/router/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/screens/profile/address/address_view.dart';
import '../../app_router.dart';

class Profile with FirebaseAuthenticationMixin {
  static final routes = [
    GoRoute(
      path: DashStitchRoutes.profile,
      parentNavigatorKey: AppRouter.profileNavigatorKey,
      redirect: (context, state) {
        if (FirebaseAuthenticationMixin.shouldAuthenticateUser(context)) {
          return DashStitchRoutes.login;
        }

        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child:ProfileView(),
          state: state,
        );
      },
    ),


    GoRoute(
      path: DashStitchRoutes.profileAddress,
      parentNavigatorKey: AppRouter.profileNavigatorKey,
      redirect: (context, state) {
        if (FirebaseAuthenticationMixin.shouldAuthenticateUser(context)) {
          return DashStitchRoutes.login;
        }

        return null;
      },
      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: AddressView(),
          state: state,
        );
      },
    ),


  ];
}
