import 'dart:io';
import 'package:messenger/domain/entities/user.dart';

abstract class IUserRepository {
  Future<User> getUser();
  Future<User> updateUser({String? name, String? phone, DateTime? birthday, String? photoUrl});
  Future<void> updateUserStatus(bool isActive);
  Future<String> loadAvatar(File file);
}
