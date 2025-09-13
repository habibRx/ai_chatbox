


import 'package:fast_pbn/config/mixins/authenticaiton_mixin.dart';
import 'package:fast_pbn/presentation/screens/cart/bag_view.dart';
import 'package:fast_pbn/router/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../app_router.dart';

class Bag with FirebaseAuthenticationMixin {
  static final routes = [
    GoRoute(
      path: DashStitchRoutes.bag,
      parentNavigatorKey: AppRouter.bagNavigatorKey,

      pageBuilder: (context, state) {
        return AppRouter.setupPage(
          child: const ProductsScreen(),
          state: state,
        );
      },
    ),



  ];
}
