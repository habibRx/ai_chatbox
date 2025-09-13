
import 'package:fast_pbn/router/routes/general/product_routes.dart';
import 'package:flutter/cupertino.dart';

import 'auth_routes.dart';
import 'notification_routes.dart';
import 'onboarding_routes.dart';

class GeneralRoutes {
  static final routes = [
    ...Onboarding.routes,
    ...Auth.routes,
    ...NotificationR.routes,
    ...ProductRoutes.routes
  ];
}
