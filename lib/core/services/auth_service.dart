import '../../get_it.dart';
import 'logging_service.dart';
import 'storage_service.dart';

/// Service for handling authentication
class AuthService {
  final _storageService = getIt<StorageService>();
  final _loggingService = getIt<LoggingService>();
  
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _isLoggedInKey = 'is_logged_in';

  Future<void> init() async {
    _loggingService.info('AuthService initialized');
  }

  Future<void> saveToken(String token) async {
    await _storageService.setString(_tokenKey, token);
  }

  String? getToken() => _storageService.getString(_tokenKey);

  Future<void> saveRefreshToken(String refreshToken) async {
    await _storageService.setString(_refreshTokenKey, refreshToken);
  }

  String? getRefreshToken() => _storageService.getString(_refreshTokenKey);

  Future<void> saveUserId(String userId) async {
    await _storageService.setString(_userIdKey, userId);
  }

  String? getUserId() => _storageService.getString(_userIdKey);

  Future<void> setLoggedIn(bool value) async {
    await _storageService.setBool(_isLoggedInKey, value);
  }

  bool isLoggedIn() => _storageService.getBool(_isLoggedInKey) ?? false;

  Future<void> login({
    required String token,
    required String refreshToken,
    required String userId,
  }) async {
    await saveToken(token);
    await saveRefreshToken(refreshToken);
    await saveUserId(userId);
    await setLoggedIn(true);
    _loggingService.info('User logged in successfully');
  }

  Future<void> logout() async {
    await _storageService.remove(_tokenKey);
    await _storageService.remove(_refreshTokenKey);
    await _storageService.remove(_userIdKey);
    await setLoggedIn(false);
    _loggingService.info('User logged out successfully');
  }

  Future<void> clearAuth() async {
    await logout();
  }
}
