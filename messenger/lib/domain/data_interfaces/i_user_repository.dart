import 'dart:io';
import 'package:messenger/domain/entities/user.dart';

abstract class IUserRepository {
  void init(
      String? email, Function(User) onUserChanged, Function(String) onUserDeleted);
  Future<User> getUser();
  Future<void> updateUser(
      {String? name, String? phone, DateTime? birthday, String? photoUrl});
  Future<void> updateUserStatus(bool isActive);
  Future<String?> loadAvatar(File file);
}
