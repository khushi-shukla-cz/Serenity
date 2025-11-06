import 'package:firebase_analytics/firebase_analytics.dart';
import '../../get_it.dart';
import 'config_service.dart';
import 'logging_service.dart';

/// Service for analytics tracking
class AnalyticsService {
  late final FirebaseAnalytics _analytics;
  final _configService = getIt<ConfigService>();
  final _loggingService = getIt<LoggingService>();

  Future<void> init() async {
    _analytics = FirebaseAnalytics.instance;
    await _analytics.setAnalyticsCollectionEnabled(_configService.enableAnalytics);
    _loggingService.info('Analytics service initialized');
  }

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    if (!_configService.enableAnalytics) return;
    
    try {
      await _analytics.logEvent(
        name: name,
        parameters: parameters,
      );
      _loggingService.debug('Analytics event logged: $name');
    } catch (e) {
      _loggingService.error('Failed to log analytics event', e);
    }
  }

  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    if (!_configService.enableAnalytics) return;
    
    try {
      await _analytics.logScreenView(
        screenName: screenName,
        screenClass: screenClass,
      );
      _loggingService.debug('Screen view logged: $screenName');
    } catch (e) {
      _loggingService.error('Failed to log screen view', e);
    }
  }

  Future<void> setUserId(String? userId) async {
    if (!_configService.enableAnalytics) return;
    
    try {
      await _analytics.setUserId(id: userId);
      _loggingService.debug('User ID set: $userId');
    } catch (e) {
      _loggingService.error('Failed to set user ID', e);
    }
  }

  Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {
    if (!_configService.enableAnalytics) return;
    
    try {
      await _analytics.setUserProperty(name: name, value: value);
      _loggingService.debug('User property set: $name = $value');
    } catch (e) {
      _loggingService.error('Failed to set user property', e);
    }
  }

  Future<void> logLogin(String loginMethod) async {
    await logEvent(
      name: 'login',
      parameters: {'method': loginMethod},
    );
  }

  Future<void> logSignUp(String signUpMethod) async {
    await logEvent(
      name: 'sign_up',
      parameters: {'method': signUpMethod},
    );
  }

  Future<void> logShare({
    required String contentType,
    required String itemId,
    required String method,
  }) async {
    await logEvent(
      name: 'share',
      parameters: {
        'content_type': contentType,
        'item_id': itemId,
        'method': method,
      },
    );
  }
}
