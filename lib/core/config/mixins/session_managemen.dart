// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:emr_005/data/session_manager/session_manager.dart';
// import 'package:emr_005/data/session_manager/session_model.dart';
// import 'package:emr_005/router/app_router.dart';
// import 'package:flutter/material.dart';
//
// mixin SessionManagerMixin {
//   static void saveSession(String route, dynamic data) {
//     SessionManager.saveSession(Session(route: route, data: jsonEncode(data)));
//   }
//
//   void clearSession() {
//     SessionManager.deleteSession();
//   }
//
//   void restoreSession(BuildContext context) {
//     if (!SessionManager.hasActiveSession) {
//       return;
//     }
//
//     final activeSession = SessionManager.activeSession;
//
//     print(activeSession!.sessions);
//
//     if (activeSession.sessions == null || activeSession.sessions!.isEmpty) {
//       _pushSession(activeSession).then((value) => clearSession());
//       return;
//     }
//     final firstRoute = activeSession.sessions!.first.route;
//
//     for (var session in activeSession.sessions!) {
//       if (firstRoute == session.route) {
//         _pushSession(session).then((value) => clearSession());
//         continue;
//       }
//       _pushSession(session);
//     }
//   }
// }
//
// Future<void> _pushSession(Session session) {
//   final route = session.route!;
//   final data = jsonDecode(session.data!);
//
//   log(route, name: "Session Manger - Restores");
//   return AppRouter.router.push(route, extra: data);
// }
