import '../../core/services/storage_service.dart';
import 'settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final StorageService storageService;

  SettingsRepositoryImpl({required this.storageService});
}
