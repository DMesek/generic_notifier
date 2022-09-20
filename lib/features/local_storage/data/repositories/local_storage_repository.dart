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
  ///Use shared preferences for storing non sensitive data
  Future<String?> get token;

  Future storeToken(String token);

  Future deleteToken();

  ///Use secure storage for storing sensitive data
  Future<String?> get password;

  Future storePassword(String token);

  Future deletePassword();
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
  Future<String?> get token async => (await _sharedPrefs).getString(_tokenKey);

  @override
  Future storeToken(String token) async =>
      (await _sharedPrefs).setString(_tokenKey, token);

  @override
  Future deleteToken() async => (await _sharedPrefs).remove(_tokenKey);

  @override
  Future<String?> get password async => _secureStorage.read(key: _passwordKey);

  @override
  Future storePassword(String password) async {
    await _secureStorage.write(key: _passwordKey, value: password);
  }

  @override
  Future deletePassword() async =>
      await _secureStorage.delete(key: _passwordKey);
}

const _tokenKey = 'token';
const _passwordKey = 'password';
