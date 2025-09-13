import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../../data/local_storage/local_storage.dart';
import '../../../../services/user_service.dart';
import 'user_model.dart';
import '../loading_cubit/loading_cubit.dart';

part 'user_cubit.freezed.dart';
part 'user_cubit.g.dart';
part 'user_state.dart';
class UserCubit extends HydratedCubit<UserState> {
  final UserService userService;
  final LoadingCubit loadingCubit;

  UserCubit(
    this.userService,
    this.loadingCubit,

  ) : super(UserState.details(user: User.initial())) {
    if (LocalStorage.userId != null) {
      // getUserDetails();
    }
  }

  final fb.FirebaseAuth auth = fb.FirebaseAuth.instance;


  void setUserID(String userID) async {
    emit(UserState.details(user: state.user.copyWith(uid: userID)));
  }

  void updateUser(User newUser) async {
    emit(UserState.details(user: newUser));
  }

  Future<({String? error})> createUserAccount({
    required String email,
    required String fullName,
    required String password,
    required File imageFile,
  }) async {
    loadingCubit.loading();

    try {
      final response = await userService.createUser(
        email: email,
        fullName: fullName,
        password: password,
        loadingCubit: loadingCubit,
        imageFile: imageFile,
      );

      if (response.isEmailVerified) {
        return (error: null);
      } else {
        return (error: response.error);
      }
    } catch (e) {
      return (error: "Signup failed: ${e.toString()}");
    } finally {
      loadingCubit.loaded(); // Stop loading
    }
  }



  Future<String?> updateProfileImage({
    required File imageFile,
  }) async {
    loadingCubit.loading();
    final imageUrl = await userService.updateProfileImage(imageFile: imageFile);
    loadingCubit.loaded();

    if (imageUrl != null) {

      final updatedUser = state.user.copyWith(
       profileImage: imageUrl
      );
      final currentUser = state;
      emit(currentUser.copyWith(user: updatedUser));
      return null;
    } else {

      return "Image upload failed. Please try again.";
    }
  }

  Future<({String? error})> login({
    required String email,
    required String password,
  }) async {
    loadingCubit.loading();

    final response = await userService.login(
      email: email,
      password: password,
    );
    loadingCubit.loaded();

    if (response.error == null) {
      final user = fb.FirebaseAuth.instance.currentUser;

      if (user != null) {
        debugPrint("User is signed in: ${user.uid}");

        try {
          final userDetails = await _fetchUserDetailsFromFirestore(user.uid);

          debugPrint("Fetched user details: $userDetails");

          final updatedUser = state.user.copyWith(
            uid: userDetails.uid,
            profileImage: userDetails.profileImage,
            email: userDetails.email,
            initialCap: userDetails.initialCap,
            targetCap: userDetails.targetCap,
            currentCap: userDetails.currentCap,

            isEmailVerified: userDetails.isEmailVerified,
            name: userDetails.name,
          );

          emit(state.copyWith(user: updatedUser));

          debugPrint("Fetched again details: ${state.user.profileImage}");

        } catch (e) {
          debugPrint("Error fetching user details: $e");
        }

      } else {
        debugPrint("User is not signed in.");
      }

      return (error: null);
    } else {
      return (error: response.error);
    }
  }



  Future<User> fetchProfile(String userId) async {
    debugPrint('Fetching user with ID: $userId');

    try {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (userDoc.exists) {
        debugPrint('Document snapshot fetched successfully.');
        debugPrint('Document data: ${userDoc.data()}');

        final user = User.fromFirestore(userDoc);
        debugPrint('User object created: $user');
        final updatedUser = state.user.copyWith(
          uid: user.uid,
          profileImage: user.profileImage,
          email: user.email,
          initialCap: user.initialCap,
          targetCap: user.targetCap,
          currentCap: user.currentCap,

          isEmailVerified: user.isEmailVerified,
          name: user.name,
        );

        emit(state.copyWith(user: updatedUser));


        return user;
      } else {
        debugPrint('No document found for userId: $userId');
        throw Exception('User not found');
      }
    } catch (e, stackTrace) {
      debugPrint('Error fetching user: $e');
      debugPrint('StackTrace: $stackTrace');
      rethrow; // rethrow to handle outside if needed
    }
  }

  Future<User> _fetchUserDetailsFromFirestore(String userId) async {
    debugPrint('Fetching user with ID: $userId');

    try {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (userDoc.exists) {
        debugPrint('Document snapshot fetched successfully.');
        debugPrint('Document data: ${userDoc.data()}');

        final user = User.fromFirestore(userDoc);
        debugPrint('User object created: $user');

        return user;
      } else {
        debugPrint('No document found for userId: $userId');
        throw Exception('User not found');
      }
    } catch (e, stackTrace) {
      debugPrint('Error fetching user: $e');
      debugPrint('StackTrace: $stackTrace');
      rethrow; // rethrow to handle outside if needed
    }
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toJson();
  }

  void clearUser() {
    emit(UserState.details(user: User.initial()));
  }
}
