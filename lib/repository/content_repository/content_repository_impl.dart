import '../../core/services/db_service.dart';
import '../../core/services/network_service.dart';
import '../../core/services/cache_service.dart';
import 'content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
  final DBService dbService;
  final NetworkService networkService;
  final CacheService cacheService;

  ContentRepositoryImpl({required this.dbService, required this.networkService, required this.cacheService});
}
