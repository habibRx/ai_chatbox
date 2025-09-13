//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// mixin AppUtils {
//   static const String _walletNotConnected =
//       "Please connect your wallet to proceed";
//
//   static const String _connectNow = "Connect";
//   static const String _verifyNow = "Verify";
//
//   bool isWalletDriverLicenseVerified(BuildContext context) {
//     if (isWalletConnected(context)) {
//       if (_isDriverLicenseVerified(context)) {
//         return true;
//       }
//     }
//     return false;
//   }
//
//   bool isUsersVehicle(BuildContext context, Vehicle vehicle) {
//     final usersID = context.read<UserCubit>().state.userID;
//
//     if (usersID != vehicle.lessorID) {
//       return false;
//     }
//     context.showSnackBar(AppConstants.rentOwnVehicleErrorMessage);
//     return true;
//   }
//
//   Future<void> _onConnectWallet(BuildContext context) {
//     return WalletConnectModal.service.openModal(context);
//   }
//
//   bool isWalletConnected(BuildContext context) {
//     final hasGeneratedWallet =
//         context.read<WalletCubit>().state.generatedWalletInfo;
//
//     final walletService = WalletConnectModal.service;
//     if (!walletService.isConnected && hasGeneratedWallet == null) {
//       context.showSnackBar(
//           _walletNotConnected,
//           BarType.action,
//           SnackBarAction(
//               label: _connectNow,
//               onPressed: () async {
//                 await _onConnectWallet(context);
//               }));
//
//       return false;
//     }
//     return true;
//   }
//
//   bool _isDriverLicenseVerified(BuildContext context) {
//     if (!context.read<UserCubit>().state.isDriversLicenseVerified) {
//       showActionSnackBar(
//           context,
//           "You need to verify your driver's license to proceed. Please click the notification icon to verify your driver's license.",
//           _verifyNow, () async {
//         AppRouter.router.push(EcomotoRoutes.notifications);
//       });
//       return false;
//     }
//     return true;
//   }
//
//   showActionSnackBar(
//       BuildContext context, error, label, void Function() onPressed) {
//     context.showSnackBar(error, BarType.action,
//         SnackBarAction(label: label, onPressed: onPressed));
//   }
// }
