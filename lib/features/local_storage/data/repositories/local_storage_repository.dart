import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = Provider<LocalStorageRepository>(
  (_) => LocalStorageRepositoryImpl(
    const FlutterSecureStorage(),
    SharedPreferences.getInstance(),
  ),
);

abstract class LocalStorageRepository {
  Future write({
    required LocalStorageKey key,
    required String value,
  });

  Future writeSecure({
    required LocalStorageKey key,
    required String value,
  });

  Future<T?> read<T>(LocalStorageKey key);

  Future<String?> readSecure(LocalStorageKey key);

  Future delete(LocalStorageKey key);

  Future deleteSecure(LocalStorageKey key);

  Future deleteAllSharedPrefs();

  Future deleteAllSecure();

  Future deleteAll();
}

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final FlutterSecureStorage _secureStorage;
  final Future<SharedPreferences> _sharedPreferencesFuture;
  SharedPreferences? _sharedPreferencesInstance;

  LocalStorageRepositoryImpl(
    this._secureStorage,
    this._sharedPreferencesFuture,
  );

  Future<SharedPreferences> get _sharedPrefs async {
    return _sharedPreferencesInstance ??= await _sharedPreferencesFuture;
  }

  @override
  Future write({
    required LocalStorageKey key,
    required String value,
  }) async {
    (await _sharedPrefs).setString(key.key, value);
  }

  @override
  Future writeSecure({
    required LocalStorageKey key,
    required String value,
  }) async {
    await _secureStorage.write(key: key.key, value: value);
  }

  @override
  Future<T?> read<T>(LocalStorageKey key) async =>
      (await _sharedPrefs).get(key.key) as T?;

  @override
  Future<String?> readSecure(LocalStorageKey key) async =>
      _secureStorage.read(key: key.key);

  @override
  Future delete(LocalStorageKey key) async =>
      (await _sharedPrefs).remove(key.key);

  @override
  Future deleteSecure(LocalStorageKey key) async =>
      await _secureStorage.delete(key: key.key);

  @override
  Future deleteAllSharedPrefs() async => (await _sharedPrefs).clear();

  @override
  Future deleteAllSecure() async => await _secureStorage.deleteAll();

  @override
  Future deleteAll() async {
    await Future.wait([
      deleteAllSharedPrefs(),
      deleteAllSecure(),
    ]);
  }
}

enum LocalStorageKey {
  token('token'),
  password('password');

  final String key;
  const LocalStorageKey(this.key);
}
