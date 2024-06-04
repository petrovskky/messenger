abstract class IAuthRepository {
  Future<String?> signIn(
    String email,
    String password,
  );
  Future<String> signUp({
    required name,
    required String email,
    required String password,
    required String phone,
  });
  Future<void> signOut();
}
