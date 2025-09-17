
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/mixins/authenticaiton_mixin.dart';
import '../../app_router.dart';
import '../../app_routes.dart';

class Bag with FirebaseAuthenticationMixin {
  static final routes = [
    GoRoute(
      path: AppRoutes.bag,
      parentNavigatorKey: AppRouter.bagNavigatorKey,

      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const Center(),
          state: state,
        );
      },
    ),



  ];
}
