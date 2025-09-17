import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app_router.dart';
import '../../app_routes.dart';

class ProductRoutes{
  static final routes = [

    GoRoute(
      path: AppRoutes.bagCheckout,
      parentNavigatorKey: AppRouter.parentNavigatorKey,

      pageBuilder: (context, state) {
        final id = state.extra as String;
        return AppRouter.setupPage(
          child:  Center(),
          state: state,
        );
      },
    ),

  ];
}