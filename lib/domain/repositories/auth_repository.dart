import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<User?> get authStateChanges;
  User? get currentUser;
  
  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String name,
    required String mobileNumber,
  });
  
  Future<UserCredential> signIn({
    required String email,
    required String password,
  });
  
  Future<void> signOut();
}
