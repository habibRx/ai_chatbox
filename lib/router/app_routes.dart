/*
  Initialize and configure GoRouter
 */
import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppRoutes {
  const AppRoutes._();
  static const String root = '/';
  static const String splash = '/splash';
  static const String onBoarding = '/onboarding';

  // Authentication Routes
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String forgetPassword = '/forget-password';
  static const String forgetPasswordOtpView = '/forget-password-otp-view';
  static const String forgetPasswordChangeView = '/forget-password-change-view';

  static const String activateAccount = '/activate-account';
  static const String otpVerification = '/otp-verification';
  static const String completeProfile = '/complete-profile';


  static const String notifcation = '/notification';
  // Home Routes
  static const String home = '/home';
  static const String chat = '/chat';
  static const String homeOnboard = '$home/onboard';
  static const String homeProductView = '$home/view-product';
  static const String homeSellerView = '$home/view-seller';

  // Explore Routes
  static const String explore = '/explore';
  static const String exploreTrends = '$explore/trending';
  static const String exploreCategory = '$explore/category';



  // Bag Routes
  static const String bag = '/bag';
  static const String bagCheckout = '$bag/checkout';

  // Profile Routes
  static const String profile = '/profile';
  static const String profileEdit = '$profile/edit';
  static const String profileAddress = '$profile/address';



  // Seller Routes
  static const String sellerDashboard = '/seller-dashboard';
  static const String sellerProducts = '/seller-products';
  static const String sellerLogin = '/seller-auth';
}
