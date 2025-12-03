import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore _firestore;

  UserRepositoryImpl({
    FirebaseFirestore? firestore,
  })  : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserEntity user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(UserModel.fromEntity(user).toFirestore());
  }

  @override
  Future<UserEntity?> getUser(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromFirestore(doc);
    }
    return null;
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .update(UserModel.fromEntity(user).toFirestore());
  }

  @override
  Stream<List<UserEntity>> watchAllUsers() {
    return _firestore.collection('users').snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => UserModel.fromFirestore(doc)).toList(),
        );
  }
}
