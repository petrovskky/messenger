abstract class IAuthRepository {
  bool get isAuthorized => false;

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
    required String? photoUrl,
  });

  Future<void> signOut();
}
