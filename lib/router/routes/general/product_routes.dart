import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/screens/product/product_view.dart';
import '../../app_router.dart';
import '../../app_routes.dart';

class ProductRoutes{
  static final routes = [

    GoRoute(
      path: DashStitchRoutes.bagCheckout,
      parentNavigatorKey: AppRouter.parentNavigatorKey,

      pageBuilder: (context, state) {
        final id = state.extra as String;
        return AppRouter.setupPage(
          child:  ProductDetailScreen(productId: id),
          state: state,
        );
      },
    ),

  ];
}