/// Service for managing application configuration
class ConfigService {
  // API Configuration
  String get apiBaseUrl => const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: 'https://api.example.com',
      );

  String get apiKey => const String.fromEnvironment(
        'API_KEY',
        defaultValue: '',
      );

  // Firebase Configuration
  String get firebaseApiKey => const String.fromEnvironment(
        'FIREBASE_API_KEY',
        defaultValue: '',
      );

  String get firebaseProjectId => const String.fromEnvironment(
        'FIREBASE_PROJECT_ID',
        defaultValue: '',
      );

  String get firebaseMessagingSenderId => const String.fromEnvironment(
        'FIREBASE_MESSAGING_SENDER_ID',
        defaultValue: '',
      );

  String get firebaseAppId => const String.fromEnvironment(
        'FIREBASE_APP_ID',
        defaultValue: '',
      );

  // App Configuration
  bool get enableAnalytics => const bool.fromEnvironment(
        'ENABLE_ANALYTICS',
        defaultValue: true,
      );

  String get appEnv => const String.fromEnvironment(
        'APP_ENV',
        defaultValue: 'development',
      );

  bool get isProduction => appEnv == 'production';
  bool get isDevelopment => appEnv == 'development';
  bool get isStaging => appEnv == 'staging';
}
