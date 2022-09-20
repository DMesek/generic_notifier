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

final firebaseMessagingRepositoryProvider = Provider<IFirebaseMessagingRepository>(
  (ref) => FirebaseMessagingRepository(),
);

class FirebaseMessagingRepository implements IFirebaseMessagingRepository {
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

abstract class IFirebaseMessagingRepository {
  EitherFailureOr<Unit> init();

  Stream<FirebaseMessagingNotification> listenForNotifications();

  Stream<String> onTokenRefresh();

  EitherFailureOr<String?> getToken();

  void close();
}

enum NotificationStartedType { onLaunch, onMessage, onResume }
