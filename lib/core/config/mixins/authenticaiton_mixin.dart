import 'dart:async';
import 'dart:developer';
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../data/local_storage/local_storage.dart';



mixin FirebaseAuthenticationMixin {
  StreamSubscription<User?>? _authSubscription;

  void onSessionExpire(BuildContext context) {
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        log("Session expired", name: "FirebaseAuthMixin");

        context.showSnackBar("Session Expired. Please log in again.");

        clearAuthentication(context);
        _authSubscription?.cancel();
        context.pushNamed("/login");
      }
    });
  }

  bool get isUserLoggedIn {
    return FirebaseAuth.instance.currentUser != null;
  }

  static bool shouldAuthenticateUser(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final localUserId = LocalStorage.userId;
    return user == null || localUserId == null;
  }

  void clearAuthentication(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await LocalStorage.deleteUserId();
    // context.read<UserCubit>().clearUser();
  }
}
