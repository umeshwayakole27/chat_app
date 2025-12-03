import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../../data/repositories/user_repository_impl.dart';
import 'auth_provider.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl();
}

@riverpod
Stream<List<UserEntity>> allUsers(Ref ref) {
  // Watch auth state to invalidate when user logs out
  final authState = ref.watch(authStateProvider);
  
  if (authState.asData?.value == null) {
    // Return empty stream when not authenticated
    return Stream.value([]);
  }
  
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.watchAllUsers();
}

@riverpod
Future<UserEntity?> currentUserData(Ref ref) async {
  final currentUser = ref.watch(currentUserProvider);
  if (currentUser == null) return null;
  
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.getUser(currentUser.uid);
}

@riverpod
Future<UserEntity?> user(Ref ref, String uid) async {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.getUser(uid);
}
