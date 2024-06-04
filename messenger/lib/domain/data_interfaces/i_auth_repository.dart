import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  });

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required DateTime? birthday,
    required String? photoUrl,
  });

  Future<void> signOut();
}
