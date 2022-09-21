import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:reusability/features/firebase_messaging/data/repositories/firebase_messaging_repository.dart';

class FirebaseMessagingNotification extends Equatable {
  final RemoteMessage remoteMessage;
  final NotificationStartedType notificationStartedType;

  const FirebaseMessagingNotification({required this.remoteMessage, required this.notificationStartedType});

  @override
  List<Object?> get props => [remoteMessage, notificationStartedType];
}
