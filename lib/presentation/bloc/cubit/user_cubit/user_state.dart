part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const UserState._();

  const factory UserState.details({required User user}) = _Details;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  // String get usernameInitials {
  //   return map(
  //     details: (state) {
  //       final user = state.user;
  //       if (user.username.isNotEmpty) {
  //         final nameParts = user.username.split(' ');
  //         if (nameParts.length > 1) {
  //           return '${nameParts[0][0]}${nameParts[1][0]}';
  //         } else {
  //           return nameParts[0][0];
  //         }
  //       } else {
  //         return '';
  //       }
  //     },
  //   );
  // }

  bool get hasUserDetails {
    return map(
      details: (state) {
        return state.userID.isNotEmpty;
      },
    );
  }

  String get userID {
    return map(
      details: (state) {
        return state.user.uid;
      },
    );
  }

  String get emailId {
    return map(
      details: (state) {
        return state.user.email;
      },
    );
  }

  // bool get isFirstLogin {
  //   return map(
  //     details: (state) {
  //       final user = state.user;
  //       return user.userOnboardingStatus == null;
  //     },
  //   );
  // }

  bool get isEmailVerified {
    return map(
      details: (state) {
        final user = state.user;
        return user.isEmailVerified;
      },
    );
  }


  // bool get isDriversLicenseVerified {
  //   return map(
  //     details: (state) {
  //       final user = state.user;
  //
  //       return !(user.userOnboardingStatus == null ||
  //           user.userOnboardingStatus == UserOnboardingStatus.setKyc);
  //     },
  //   );
  // }
}
