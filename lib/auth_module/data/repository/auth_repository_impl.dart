import 'package:happy_grocers/auth_module/data/datasources/auth_data_source.dart';
import 'package:happy_grocers/auth_module/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthDataSource authDateSource;

  AuthRepositoryImpl({required this.authDateSource});
}
