//TODO;refactor all enums to have values



enum UserWalletType {
  walletProvider,
  generatedWallet,
}

enum AppThemeMode { light, dark, blue }

enum VehicleListingState {
  uploadImagesVideos("Processing Images and Videos..."),
  createVehicleData("Creating Vehicle Data..."),
  updateVehicleData("Updating Vehicle Data..."),
  makePayment(
      "To complete your vehicle listing, please make the transaction. Open your wallet and confirm the transaction."),
  verifyPayment("Verifying Transaction...");

  const VehicleListingState(this.value);
  final String value;
}

enum VehicleRentingState {
  getApproval(
      "Requesting Approval ... \nOpen your wallet and confirm the transaction."),
  makePayment(
      "To complete your vehicle rental, please make the transaction. Open your wallet and confirm the transaction."),
  makePaymentGenWallet("Processing Payment..."),
  verifyPayment("Verifying Transaction..."),
  createRental("Creating Rental..."),
  createEscrow("Creating Escrow..."),
  verifyingApproval("Verifying Transaction...");

  const VehicleRentingState(this.value);
  final String value;
}

enum EndRentalState {
  lockVehicle("Locking Vehicle..."),
  uploadImages("Uploading Images..."),
  updateRental("Ending Trip...");

  const EndRentalState(this.value);
  final String value;
}

enum StartRentalState {
  unlockVehicle("Unlocking Vehicle..."),
  uploadImages("Uploading Images..."),
  createRental("Creating Rental"),
  updateRental("Starting Trip...");

  const StartRentalState(this.value);
  final String value;
}

enum LoadingStatus { loading, initial }

enum AuthenticationStatus { authenticated, unAuthenticated }

enum DashboardType {
  lessor("Lessor Dashboard"),
  lesses("Lessee Dashboard");

  const DashboardType(this.value);
  final String value;
}

enum StorageAction { add, remove, clear }


enum Environment {
  development("DEV"),
  production("PROD"),
  staging("STAG");

  const Environment(this.value);
  final String value;
}

enum UserOnboardingStatus {
  setKyc,
  setNames,
  verifyDriverLicense,
  verifyEmail;

  String get value {
    return name[0].toUpperCase() + name.substring(1);
  }
}

enum EscrowDepositStatus {
  active,
  reversed,
  settled,
}

enum BarType { error, success, loading, action }

enum RentalStatus {
  accepted,
  ready,
  active,
  completed,
  extended,
  rejected,
  requesting,
  settled,
  booked,
  reserved;

  String get value {
    return name[0].toUpperCase() + name.substring(1);
  }
}

enum UserUserType {
  lessee,
  lessor,
}

enum OrderBy {
  asc,
  desc,
}

enum EIP155Methods {
  personalSign,
  ethSign,
  ethSignTransaction,
  ethSignTypedData,
  ethSendTransaction,
}

enum EIP155Events {
  chainChanged,
  accountsChanged,
}

class AppEnums {
  static UserOnboardingStatus? userOnboardingStatusFromString(String? status) {
    switch (status) {
      case 'SetKyc':
        return UserOnboardingStatus.setKyc;
      case 'SetNames':
        return UserOnboardingStatus.setNames;
      case 'VerifyDriverLicense':
        return UserOnboardingStatus.verifyDriverLicense;
      case 'VerifyEmail':
        return UserOnboardingStatus.verifyEmail;
      default:
        return null;
    }
  }

  static EscrowDepositStatus escrowDepositStatusFromString(String status) {
    switch (status) {
      case 'Active':
        return EscrowDepositStatus.active;
      case 'Reversed':
        return EscrowDepositStatus.reversed;
      case 'Settled':
        return EscrowDepositStatus.settled;
      default:
        throw Exception('Invalid EscrowDepositStatus');
    }
  }

  static RentalStatus? rentalRentalStatusFromString(String status) {
    switch (status) {
      case 'Accepted':
        return RentalStatus.accepted;
      case 'Active':
        return RentalStatus.active;
      case 'Completed':
        return RentalStatus.completed;
      case 'Extended':
        return RentalStatus.extended;
      case 'Rejected':
        return RentalStatus.rejected;
      case 'Requesting':
        return RentalStatus.requesting;
      case 'Settled':
        return RentalStatus.settled;
      case 'Booked':
        return RentalStatus.booked;
      default:
        return null;
    }
  }

  static UserUserType userUserTypeFromString(String type) {
    switch (type) {
      case 'Lessee':
        return UserUserType.lessee;
      case 'Lessor':
        return UserUserType.lessor;
      default:
        throw Exception('Invalid UserUserType');
    }
  }
}

enum HttpMethod {
  get("GET"),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  const HttpMethod(this.value);
  final String value;
}

enum HapticFeedbackType {
  light,
  medium,
  heavy,
  selection,
  vibrate,
}

enum ServiceEnvironment {
  ecomoto,
  ecobook,
}

enum SelectedFile {
  images,
  otherImages,
  videos,
}
