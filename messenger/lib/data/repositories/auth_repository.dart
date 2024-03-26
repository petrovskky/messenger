import 'package:messenger/data/utils/fake_db.dart';
import 'package:messenger/domain/data_interfaces/i_auth_repository.dart';
import 'package:messenger/domain/entities/user.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<String?> signIn(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return userList.cast<User?>().firstWhere((e) => e?.email == email, orElse: () => null)?.id; // user id
  }

  @override
  Future<String> signUp({
    required name,
    required String email,
    required String password,
    required String phone,
  }) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    final user = User(
      id: userList.length.toString(),
      name: name,
      email: email,
      isActive: true,
      phone: phone,
    );
    return user.id; // user id
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(Duration(milliseconds: 1), () {});
  }
}
