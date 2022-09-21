import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/notifiers/base_state.dart';
import 'package:reusability/features/firebase_messaging/data/entities/firebase_messaging_notification.dart';
import 'package:reusability/features/firebase_messaging/domain/notifiers/firebase_messaging_notifier.dart';

extension FirebaseMessagingExtensions on WidgetRef {
  void firebaseMessagingNotificationListener(BuildContext _) {
    listen<BaseState<FirebaseMessagingNotification, void>>(
      firebaseMessagingNotifier,
      (previous, current) {
        current.maybeWhen(
          data: (firebaseMessagingNotification) {
            log('to show $firebaseMessagingNotification');
          },
          orElse: () => null,
        );
      },
    );
  }
}
