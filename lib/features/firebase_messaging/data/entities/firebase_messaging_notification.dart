// ignore_for_file: always_use_package_imports

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../repositories/firebase_messaging_repository.dart';

class FirebaseMessagingNotification extends Equatable {
  final RemoteMessage remoteMessage;
  final NotificationStartedType notificationStartedType;

  const FirebaseMessagingNotification({required this.remoteMessage, required this.notificationStartedType});

  @override
  List<Object?> get props => [remoteMessage, notificationStartedType];
}
