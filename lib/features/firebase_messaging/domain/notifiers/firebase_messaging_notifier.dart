// ignore_for_file: always_use_package_imports

import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/domain/notifiers/base_state.dart';
import '../../../../common/domain/notifiers/base_state_notifier.dart';
import '../../data/entities/firebase_messaging_notification.dart';
import '../../data/repositories/firebase_messaging_repository.dart';

final firebaseMessagingNotifier =
    StateNotifierProvider<FirebaseMessagingNotifier, BaseState<FirebaseMessagingNotification, void>>(
  (ref) => FirebaseMessagingNotifier(ref.watch(firebaseMessagingRepositoryProvider), ref.read),
);

class FirebaseMessagingNotifier extends BaseStateNotifier<FirebaseMessagingNotification, void> {
  final FirebaseMessagingRepository _firebaseMessagingRepository;

  FirebaseMessagingNotifier(this._firebaseMessagingRepository, super.reader) {
    _init();
  }

  @override
  void dispose() {
    _firebaseMessagingRepository.close();
    super.dispose();
  }

  Future<void> _init() async {
    final result = await _firebaseMessagingRepository.init();
    result.fold((failure) => setGlobalFailure(failure), (_) {
      _getToken();
      _onTokenRefresh();
      _listenForNotification();
    });
  }

  void _listenForNotification() async {
    await for (FirebaseMessagingNotification firebaseMessagingNotification
        in _firebaseMessagingRepository.listenForNotifications()) {
      state = BaseState.data(firebaseMessagingNotification);
    }
  }

  void _getToken() async {
    final result = await _firebaseMessagingRepository.getToken();
    result.fold((_) => null, (token) => log('notification token: $token'));
  }

  void _onTokenRefresh() async {
    await for (String token in _firebaseMessagingRepository.onTokenRefresh()) {
      log('notification token changed: $token');
    }
  }
}
