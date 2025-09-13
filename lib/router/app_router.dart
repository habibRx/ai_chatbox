import 'dart:developer';

import 'package:ed_chat/router/routes/general/general_routes.dart';
import 'package:ed_chat/router/routes/home/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/config/mixins/authenticaiton_mixin.dart';
import 'app_routes.dart';

class AppRouter with FirebaseAuthenticationMixin {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  static AppRouter get instance => _instance;

  // Navigation keys
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
          routes: Explore.routes,
        ),
        StatefulShellBranch(
          navigatorKey: bagNavigatorKey,
          routes: Bag.routes,
        ),
        StatefulShellBranch(
          navigatorKey: profileNavigatorKey,
          routes: Profile.routes,
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

// ... keep all your existing methods (setupPage, _shellRoutes, etc.) ...
}
// class AppRouter with FirebaseAuthenticationMixin {
//   // Private constructor
//   AppRouter._internal() : _router = _createRouter() {
//     log("Initialized", name: "Router");
//   }
//
//   // Factory constructor returns the singleton instance
//   factory AppRouter() {
//     return _instance;
//   }
//
//   // Singleton instance
//   static final AppRouter _instance = AppRouter._internal();
//
//   // Public access to the singleton instance
//   static AppRouter get instance => _instance;
//
//   // Router creation
//   static GoRouter _createRouter() {
//     final routes = [
//       _instance._shellRoutes(),
//       ...GeneralRoutes.routes,
//     ];
//
//     return GoRouter(
//       navigatorKey: parentNavigatorKey,
//       initialLocation: DashStitchRoutes.splash,
//       routes: routes,
//     );
//   }
//
//   // Navigation keys
//   static GlobalKey<NavigatorState> get generateNavigatorKey => GlobalKey<NavigatorState>();
//   static final GlobalKey<NavigatorState> parentNavigatorKey = generateNavigatorKey;
//   static final GlobalKey<NavigatorState> homeNavigatorKey = generateNavigatorKey;
//   static final GlobalKey<NavigatorState> exploreNavigatorKey = generateNavigatorKey;
//   static final GlobalKey<NavigatorState> bagNavigatorKey = generateNavigatorKey;
//   static final GlobalKey<NavigatorState> profileNavigatorKey = generateNavigatorKey;
//
//   // The actual router instance (no longer late)
//   final GoRouter _router;
//
//   // Public access to the router
//   static GoRouter get router => _instance._router;
//
//   // Helper methods
//   static Page setupPage({
//     required Widget child,
//     required GoRouterState state,
//   }) {
//     return MaterialPage(
//       key: state.pageKey,
//       child: child,
//     );
//   }
//
//   BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;
//   GoRouterDelegate get routerDelegate => router.routerDelegate;
//   GoRouteInformationParser get routeInformationParser => router.routeInformationParser;
//
//   StatefulShellRoute _shellRoutes() {
//     return StatefulShellRoute.indexedStack(
//       parentNavigatorKey: parentNavigatorKey,
//       branches: [
//         StatefulShellBranch(
//           navigatorKey: homeNavigatorKey,
//           routes: Home.routes,
//         ),
//         StatefulShellBranch(
//           navigatorKey: exploreNavigatorKey,
//           routes: Explore.routes,
//         ),
//         StatefulShellBranch(
//           navigatorKey: bagNavigatorKey,
//           routes: Bag.routes,
//         ),
//         StatefulShellBranch(
//           navigatorKey: profileNavigatorKey,
//           routes: Profile.routes,
//         ),
//       ],
//       pageBuilder: (
//           BuildContext context,
//           GoRouterState state,
//           StatefulNavigationShell navigationShell,
//           ) {
//         return setupPage(
//           child: PopScope(
//             canPop: false,
//             child: AppBottomNavigator(
//               showBnb: true,
//               child: navigationShell,
//             ),
//           ),
//           state: state,
//         );
//       },
//     );
//   }
// }
//
// final router = GoRouter(
//   initialLocation: DashStitchRoutes.splash,
//   routes: [
//     StatefulShellRoute.indexedStack(
//       builder: (context, state, navigationShell) {
//         return ScaffoldWithNavBar(navigationShell: navigationShell);
//       },
//       branches: [
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//                 path: '/home',
//                 builder: (context, state) => HomeScreenView()
//             ),
//
//             GoRoute(
//               path: '/create_trade',
//               builder: (context, state) => Center(),
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             // GoRoute(
//             //   path: '/explore',
//             //   builder: (context, state) =>  const ExploreView(),
//             // ),
//             GoRoute(path: '/charts', builder: (context, state) => Center(
//               child: Text("This is categories page"),
//
//             )),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(path: '/calendar', builder: (context, state) => Center(
//               child: Text("This is bag page"),
//
//             )),
//             // GoRoute(
//             //   path: '/date-details',
//             //   builder: (context, state) {
//             //     final tradeDate = state.extra as DateTime;
//             //     return DateTradeScreen(tradeDate: tradeDate);
//             //   },
//             // ),
//             // GoRoute(
//             //   path: '/stock-details',
//             //   builder: (context, state) {
//             //     final stockName = state.extra as String;
//             //     return StockTradeScreen(stockName: stockName);
//             //   },
//             // ),
//           ],
//         ),
//
//         // StatefulShellBranch(
//         //   routes: [
//         //     GoRoute(
//         //       path: '/calculator',
//         //       builder: (context, state) =>  const CalculatorView(),
//         //     ),
//         //   ],
//         // ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(path: '/profile', builder: (context, state) => Center(
//               child: Text("This is home page"),
//
//             )),
//           ],
//         ),
//
//         // StatefulShellBranch(
//         //   routes: [
//         //     GoRoute(
//         //       path: '/about',
//         //       builder: (context, state) => const AboutPage(),
//         //     ),
//         //   ],
//         // ),
//       ],
//     ),
//     // Routes without BottomNav
//     GoRoute(path: '/login', builder: (context, state) => Center()),
//
//     GoRoute(path: '/signup', builder: (context, state) => Center()),
//     GoRoute(path: '/splash', builder: (context, state) => OnBoardingView()),
//
//     // GoRoute(
//     //   path: '/test',
//     //   builder: (context, state) => const GradientBackgroundScreen(),
//     // ),
//     // GoRoute(
//     //   path: '/chart',
//     //   builder: (context, state) => const ChartScreen(),
//     // ),
//   ],
// );
//
// class ScaffoldWithNavBar extends StatelessWidget {
//   final StatefulNavigationShell navigationShell;
//
//   const ScaffoldWithNavBar({super.key, required this.navigationShell});
//
//   void _onTap(int index) {
//     navigationShell.goBranch(
//       index,
//       initialLocation: index == navigationShell.currentIndex,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: navigationShell,
//       bottomNavigationBar: SafeArea(
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.shifting,
//           elevation: 1.5,
//           currentIndex: navigationShell.currentIndex,
//           onTap: _onTap,
//           selectedItemColor: AppColors.secondaryColor,
//           unselectedItemColor: context.colorScheme.surface,
//           items: [
//             BottomNavigationBarItem(
//               backgroundColor: Theme.of(context).primaryColor,
//               icon: const Icon(Icons.home_filled),
//               label: 'Home',
//               tooltip: "Home",
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: Theme.of(context).primaryColor,
//               icon: const Icon(Icons.dashboard_customize_sharp),
//               label: 'Categories',
//               tooltip: "Categories",
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: Theme.of(context).primaryColor,
//               icon: const Icon(Icons.shopping_bag_sharp),
//               label: 'Bag',
//               tooltip: "Bag",
//             ),
//
//             BottomNavigationBarItem(
//               backgroundColor: Theme.of(context).primaryColor,
//               icon: Icon(Icons.person),
//               tooltip: "Profile",
//               label: 'Profile',
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AboutPage extends StatelessWidget {
//   const AboutPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     String info = "Proactive and detail-oriented Flutter Developer with 1 year, 10+ months of hands-on experience, including 6 months as an intern and 1 year 4 months as a Junior Flutter Developer. Skilled in building scalable cross-platform applications using Flutter, Firebase, and GraphQL. Proven ability to contribute to both frontend architecture and backend integrations. Passionate about creating clean, user-centric mobile applications with a focus on performance and maintainability.";
//
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Image.asset(
//               AppImages.logo,
//               height: context.viewSize.width*.50,
//               width: context.viewSize.width*.50,
//             ),
//           ),
//           Text("Created by Habeeb Khan"),
//
//
//           Text(
//               info.toLowerCase(),
//           style: GoogleFonts.dancingScript(
//             color: Colors.brown
//           ),
//           textAlign: TextAlign.center,).withContentPadded,
//
//           SizedBox(height: context.viewSize.width*.20,),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//
//                   onPressed: () async {
//                     final url = Uri.parse("https://play.google.com/store/apps/details?id=com.orokii.app&hl=en&gl=US&pli=1");
//                     if (await canLaunchUrl(url)) {
//                       await launchUrl(url, mode: LaunchMode.externalApplication);
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Could not launch Play Store")),
//                       );
//                     }
//                   },  child: Text('Orokii Inc ')),
//
//
//               TextButton(onPressed: (){
//                 showModalBottomSheet(
//                   backgroundColor: context.colorScheme.surface,
//                   context: context,
//                   isScrollControlled: true,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius:
//                     BorderRadius.vertical(top: Radius.circular(20)),
//                   ),
//                   builder: (context) {
//                     return Padding(
//                       padding: EdgeInsets.only(
//                         bottom:
//                         MediaQuery.of(context).viewInsets.bottom,
//                         left: 16,
//                         right: 16,
//                         top: 20,
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text("It is an startup which was under development untill the company decided to hold the further development due to lack of funds."
//                               "Since it is a startup cant display its ui and functions of the app"
//                               "")
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//                   child: Text('Ecomoto'))
//             ],
//           ).withHorViewPadding
//
//         ],
//       ),
//     );
//   }
//
// }
