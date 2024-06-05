import 'dart:io';

abstract class IAuthRepository {
  bool get isAuthorized => false;
  String? userId;
  String? get userEmail;

  Future<bool> signIn({
    required String email,
    required String password,
  });

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required DateTime? birthday,
    required File? photo,
  });

  Future<void> signOut();
}
