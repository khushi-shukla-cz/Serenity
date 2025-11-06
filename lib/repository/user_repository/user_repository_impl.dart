import '../../core/services/db_service.dart';
import '../../core/services/network_service.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final DBService dbService;
  final NetworkService networkService;

  UserRepositoryImpl({required this.dbService, required this.networkService});
}
