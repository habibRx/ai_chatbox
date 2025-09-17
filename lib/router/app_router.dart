import 'dart:developer';

import 'package:ed_chat/router/routes/general/general_routes.dart';
import 'package:ed_chat/router/routes/home/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/config/mixins/authenticaiton_mixin.dart';
import '../presentation/widget/bottom_navigator/bottom_navigator.dart';
import 'app_routes.dart';

class AppRouter with FirebaseAuthenticationMixin {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  static AppRouter get instance => _instance;

  static final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> exploreNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> bagNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> profileNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _router;

  AppRouter._internal() {
    _router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: AppRoutes.splash,
      routes: [
        _shellRoutes(),
        ...GeneralRoutes.routes,
      ],
    );
    log("Router Initialized");
  }

  static GoRouter get router => _instance._router;

  // Helper methods
  static Page setupPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;
  GoRouterDelegate get routerDelegate => router.routerDelegate;
  GoRouteInformationParser get routeInformationParser => router.routeInformationParser;

  StatefulShellRoute _shellRoutes() {
    return StatefulShellRoute.indexedStack(
      parentNavigatorKey: parentNavigatorKey,
      branches: [
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: Home.routes,
        ),
        StatefulShellBranch(
          navigatorKey: exploreNavigatorKey,
          routes: [
            GoRoute(
              path: AppRoutes.explore,
              parentNavigatorKey: AppRouter.exploreNavigatorKey,
              pageBuilder: (context, state) {
                return AppRouter.setupPage(
                  child: Center(),
                  state: state,
                );
              },
            ),

          ],
        ),
        StatefulShellBranch(
          navigatorKey: bagNavigatorKey,
          routes: [

            GoRoute(
              path: AppRoutes.explore,
              parentNavigatorKey: AppRouter.bagNavigatorKey,
              pageBuilder: (context, state) {
                return AppRouter.setupPage(
                  child: Center(),
                  state: state,
                );
              },
            ),

          ],
        ),
        StatefulShellBranch(
          navigatorKey: profileNavigatorKey,
          routes: [

            GoRoute(
              path: AppRoutes.explore,
              parentNavigatorKey: AppRouter.profileNavigatorKey,
              pageBuilder: (context, state) {
                return AppRouter.setupPage(
                  child: Center(),
                  state: state,
                );
              },
            ),

          ],
        ),
      ],
      pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
          ) {
        return setupPage(
          child: PopScope(
            canPop: false,
            child: SafeArea(
              top: false,
              child: AppBottomNavigator(
              showBnb: true,
              child: navigationShell,
            ),)
          ),
          state: state,
        );
      },
    );
  }
}
