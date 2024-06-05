import 'package:messenger/data/utils/constants.dart';
import 'package:messenger/domain/data_interfaces/i_auth_repository.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository implements IAuthRepository {
  final firebase_auth.FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRepository({required this.firebaseAuth, required this.firebaseFirestore});

  @override
  bool get isAuthorized => firebaseAuth.currentUser != null;
  
  @override
  String? userId;

  @override
  String? get userEmail => firebaseAuth.currentUser?.email;

  @override
  Future<bool> signIn({required String email, required String password}) async {
    final res = (await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password));
    if (isAuthorized) {
      final userQuery = firebaseFirestore
          .collection(usersPath)
          .where('email', isEqualTo: email)
          .limit(1);

      final userSnapshot = await userQuery.get();
      if (userSnapshot.docs.isNotEmpty) {
        final userData = userSnapshot.docs.first.data();
        userId = userData['userId'] as String?;
      }
    }
    return res != null;
  }

  @override
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required DateTime? birthday,
    required String? photoUrl,
  }) async {
    final authRes = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final storageRes = (await firebaseFirestore.collection(usersPath).add({
      'name': name,
      'email': email,
      'phone': phone,
      'birthday': birthday?.toIso8601String(),
      'photoUrl': photoUrl,
    }));
    userId = storageRes.id;
    return storageRes.id;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
