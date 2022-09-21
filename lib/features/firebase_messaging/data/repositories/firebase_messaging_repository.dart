// ignore_for_file: always_use_package_imports

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/domain/either_failure_or.dart';
import '../../../../common/domain/entitites/failure.dart';
import '../entities/firebase_messaging_notification.dart';

final firebaseMessagingRepositoryProvider = Provider<FirebaseMessagingRepository>(
  (ref) => FirebaseMessagingRepositoryImpl(),
);

abstract class FirebaseMessagingRepository {
  EitherFailureOr<Unit> init();

  Stream<FirebaseMessagingNotification> listenForNotifications();

  Stream<String> onTokenRefresh();

  EitherFailureOr<String?> getToken();

  void close();
}

class FirebaseMessagingRepositoryImpl implements FirebaseMessagingRepository {
  StreamController<FirebaseMessagingNotification>? _notificationStream;

  @override
  EitherFailureOr<Unit> init() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: false,
        badge: false,
        sound: false,
      );
    }
    final settings = await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final message = await FirebaseMessaging.instance.getInitialMessage();
      if (message != null && message.notification != null) {
        _processNotification(message, NotificationStartedType.onLaunch);
      }
      FirebaseMessaging.onMessage
          .listen((RemoteMessage message) => _processNotification(message, NotificationStartedType.onMessage));
      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) => _processNotification(message, NotificationStartedType.onResume));
      return const Right(unit);
    }
    return Left(Failure.permissionDenied());
  }

  @override
  EitherFailureOr<String?> getToken() async => Right(await FirebaseMessaging.instance.getToken());

  @override
  Stream<FirebaseMessagingNotification> listenForNotifications() {
    if (_notificationStream != null) {
      close();
    }
    _notificationStream = StreamController<FirebaseMessagingNotification>();
    return _notificationStream!.stream;
  }

  @override
  Stream<String> onTokenRefresh() => FirebaseMessaging.instance.onTokenRefresh;

  @override
  void close() {
    _notificationStream?.close();
  }

  void _processNotification(
    RemoteMessage message,
    NotificationStartedType notificationStartedType,
  ) {
    log('''Got raw notification in ${notificationStartedType.toString()} 
            notification title: ${message.notification?.title}, 
            body: ${message.notification?.body}, 
            data: ${message.data}''');
    _notificationStream
        ?.add(FirebaseMessagingNotification(remoteMessage: message, notificationStartedType: notificationStartedType));
  }
}

enum NotificationStartedType { onLaunch, onMessage, onResume }

/// To finish Android setup create Android app on Firebase console, generate keystore fingerprints and store them in Firebase console for your app,
/// add google-services.json to android/app/ directory,
/// add "classpath 'com.google.gms:google-services:<latest_version>'" to android/build.gradle file
/// and add "apply plugin: 'com.google.gms.google-services'" to android/app/build.gradle file
///
/// To finish iOS setup create iOS app on Firebase console, add auth key or push notification certificate from developer.apple.com to it,
/// add PushNotification capability in Xcode (ios/Runner/Runner.entitlements file) and
/// add GoogleService-Info.plist file to ios/Runner directory
///
/// For both platforms, add Firebase.initializeApp() in main.dart
