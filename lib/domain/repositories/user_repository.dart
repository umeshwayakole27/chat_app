import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<void> createUser(UserEntity user);
  Future<UserEntity?> getUser(String uid);
  Future<void> updateUser(UserEntity user);
  Stream<List<UserEntity>> watchAllUsers();
}
