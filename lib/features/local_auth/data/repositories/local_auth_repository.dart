// ignore_for_file: always_use_package_imports, depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/error_codes.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

import '../../../../common/domain/either_failure_or.dart';
import '../../../../common/domain/entitites/failure.dart';

final localAuthRepositoryProvider =
    Provider<LocalAuthRepository>((ref) => LocalAuthRepositoryImpl(LocalAuthentication()));

abstract class LocalAuthRepository {
  EitherFailureOr<BiometricType> getAvailableBiometricType();

  EitherFailureOr<bool> authenticate({
    required String localizedReason,
    List<AuthMessages>? authMessages,
    AuthenticationOptions? options,
  });
}

class LocalAuthRepositoryImpl implements LocalAuthRepository {
  final LocalAuthentication _localAuthentication;

  const LocalAuthRepositoryImpl(this._localAuthentication);

  @override
  EitherFailureOr<bool> authenticate({
    required String localizedReason,
    List<AuthMessages>? authMessages,
    AuthenticationOptions? options,
  }) async {
    try {
      final result = await _localAuthentication.authenticate(
        localizedReason: localizedReason,
        authMessages: authMessages ?? [const AndroidAuthMessages(biometricHint: '')],
        options: options ?? const AuthenticationOptions(),
      );
      return Right(result);
    } on PlatformException catch (error, stackTrace) {
      if (error.code == notEnrolled) {
        return Left(Failure.generic(title: 'No hardware', error: error, stackTrace: stackTrace));
      } else if (error.code == lockedOut || error.code == permanentlyLockedOut) {
        return Left(Failure.generic(title: 'Locked out', error: error, stackTrace: stackTrace));
      } else {
        return Left(Failure.generic(title: 'Local auth error', error: error, stackTrace: stackTrace));
      }
    }
  }

  @override
  EitherFailureOr<BiometricType> getAvailableBiometricType() async {
    final availableBiometrics = await LocalAuthentication().getAvailableBiometrics();
    if (availableBiometrics.isEmpty) {
      return Left(Failure.noBiometricsAvailable());
    } else if (availableBiometrics.contains(BiometricType.face)) {
      return const Right(BiometricType.face);
    } else if (availableBiometrics.contains(BiometricType.iris)) {
      return const Right(BiometricType.iris);
    }
    return const Right(BiometricType.fingerprint);
  }
}

/// To finish Android setup you need to add permission to your AndroidManifest.xml file
/// "<uses-permission android:name="android.permission.USE_BIOMETRIC"/>",
/// then change that MainActivity (whether java or kotlin) extends FlutterFragmentActivity instead of FlutterActivity
/// and then change res/values/styles.xml that styles parent is "@style/Theme.AppCompat.Light.NoActionBar"
/// instead of "@android:style/Theme.Light.NoTitleBar"
///
/// For iOS setup you need to add permission to Info.plist file:
///<key>NSFaceIDUsageDescription</key>
/// <string>Text with explanation why you need to use Face ID></string>
