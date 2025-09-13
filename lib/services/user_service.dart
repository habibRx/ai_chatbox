import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_chat/services/pinata_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/local_storage/local_storage.dart';
import '../presentation/bloc/cubit/loading_cubit/loading_cubit.dart';


class UserService {
  UserService();

  // static void _logger(Object error, Object stTrace) {
  //   log(error.toString() + stTrace.toString(), name: "UserService Logger ");
  // }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fStore = FirebaseFirestore.instance;

  Future<({
  String? error,
  Map<String, String>? user,
  bool isEmailVerified,
  })> login({
    required String email,
    required String password,
  }) async {
    try {

      final credential = await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = credential.user;

      if (user == null) {
        return (
        error: "User not found",
        user: null,
        isEmailVerified: false,
        );
      }

      final userId = user.uid;
      final userEmail = user.email ?? '';
      final isEmailVerified = user.emailVerified;

      await Future.wait([
        LocalStorage.saveUserId(userId),
        LocalStorage.saveEmail(userEmail),
        LocalStorage.saveEmailVerification(isEmailVerified),
      ]);

      return (
      error: null,
      user: {'userID': userId, 'email': userEmail},
      isEmailVerified: isEmailVerified,
      );
    } on FirebaseAuthException catch (e) {
      return (
      error: e.message ?? "Firebase Auth Error",
      user: null,
      isEmailVerified: false,
      );
    } catch (e) {
      return (
      error: "Unexpected error: ${e.toString()}",
      user: null,
      isEmailVerified: false,
      );
    }
  }


  Future<String?> updateProfileImage({
    required File imageFile,
  }) async {
    try {
      final imageUrl = await _uploadProfileImageToPinata(profileImage: imageFile);
      if (imageUrl == null) return null;

      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) return null;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'profileImage': imageUrl,
      });

      return imageUrl;
    } catch (e) {
      return null;
    }
  }



  Future<
      ({
        String? error,
        String? uid,
        bool isEmailVerified,
      })> createUser({
    required String email,
    required String password,
    required String fullName,
    required File? imageFile,
    required LoadingCubit loadingCubit,
  }) async {
    try {
      loadingCubit.loading(message: "Uploading image");
      final imageUrl =
          await _uploadProfileImageToPinata(profileImage: imageFile);

      loadingCubit.loaded;

      if (imageUrl == null) {
        return (
          error: "Image upload failed. Please try again.",
          uid: null,
          isEmailVerified: false
        );
      }

      loadingCubit.loading(message: "Creating User");
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = userCredential.user;
      if (user == null) {
        loadingCubit.loaded;
        return (
          error: "User creation failed.",
          uid: null,
          isEmailVerified: false
        );
      }

      await fStore.collection('users').doc(user.uid).set({
        'email': email.trim(),
        'name': fullName.trim(),
        'profileImage': imageUrl,
        'isEmailVerified': true,
        'createdAt': FieldValue.serverTimestamp(),
      });

      loadingCubit.loaded;
      return (error: null, uid: user.uid, isEmailVerified: user.emailVerified);
    } on FirebaseAuthException catch (e) {
      return (
        error: e.message ?? "Auth error",
        uid: null,
        isEmailVerified: false
      );
    } catch (e) {
      return (error: e.toString(), uid: null, isEmailVerified: false);
    }
  }

  Future<String?> _uploadProfileImageToPinata(
      {required File? profileImage}) async {
    if (profileImage == null) return null;

    final pinataService = PinataService();
    String? imageUrl = await pinataService.uploadImageToPinata(profileImage);

    return imageUrl;
  }


  // Future<String?> _fetchProfileUrl() async {
  //
  //   final pinataService = PinataService();
  //   String? imageUrl = await pinataService.uploadImageToPinata(profileImage);
  //
  //   return imageUrl;
  // }
}
