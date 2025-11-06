import 'package:get_it/get_it.dart';

import 'core/services/analytics_service.dart';
import 'core/services/auth_service.dart';
import 'core/services/cache_service.dart';
import 'core/services/config_service.dart';
import 'core/services/db_service.dart';
import 'core/services/logging_service.dart';
import 'core/services/network_service.dart';
import 'core/services/notification_service.dart';
import 'core/services/storage_service.dart';
import 'repository/content_repository/content_repository.dart';
import 'repository/content_repository/content_repository_impl.dart';
import 'repository/settings_repository/settings_repository.dart';
import 'repository/settings_repository/settings_repository_impl.dart';
import 'repository/user_repository/user_repository.dart';
import 'repository/user_repository/user_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register services
  getIt.registerLazySingleton<LoggingService>(() => LoggingService());
  getIt.registerLazySingleton<ConfigService>(() => ConfigService());
  
  // Register and initialize storage service
  final storageService = StorageService();
  await storageService.init();
  getIt.registerSingleton<StorageService>(storageService);
  
  // Register and initialize database service
  final dbService = DBService();
  await dbService.init();
  getIt.registerSingleton<DBService>(dbService);
  
  getIt.registerLazySingleton<NetworkService>(() => NetworkService());
  getIt.registerLazySingleton<CacheService>(() => CacheService());
  
  // Initialize auth service
  final authService = AuthService();
  await authService.init();
  getIt.registerSingleton<AuthService>(authService);
  
  // Initialize analytics service
  final analyticsService = AnalyticsService();
  await analyticsService.init();
  getIt.registerSingleton<AnalyticsService>(analyticsService);
  
  // Initialize notification service
  final notificationService = NotificationService();
  await notificationService.init();
  getIt.registerSingleton<NotificationService>(notificationService);

  // Register repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      dbService: getIt<DBService>(),
      networkService: getIt<NetworkService>(),
    ),
  );

  getIt.registerLazySingleton<ContentRepository>(
    () => ContentRepositoryImpl(
      dbService: getIt<DBService>(),
      networkService: getIt<NetworkService>(),
      cacheService: getIt<CacheService>(),
    ),
  );

  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      storageService: getIt<StorageService>(),
    ),
  );
}
