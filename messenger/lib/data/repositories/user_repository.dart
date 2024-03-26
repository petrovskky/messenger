import 'dart:io';
import 'package:messenger/data/utils/fake_db.dart';
import 'package:messenger/domain/data_interfaces/i_user_repository.dart';
import 'package:messenger/domain/entities/user.dart';

class UserRepository implements IUserRepository {
  //final String _token;
  final String _id;

  UserRepository({required String token, required String id}) : _id = id;

  @override
  Future<User> getUser() async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return userList.firstWhere((e) => e.id == _id);
  }

  @override
  Future<User> updateUser({
    String? name,
    String? phone,
    DateTime? birthday,
    String? photoUrl,
  }) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return userList.firstWhere((e) => e.id == _id)
      ..edit(
        newName: name,
        newPhone: phone,
        newBirthday: birthday,
        newPhotoUrl: photoUrl,
      );
  }

  @override
  Future<void> updateUserStatus(bool isActive) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    userList.firstWhere((e) => e.id == _id).updateStatus(isActive);
  }

  @override
  Future<String> loadAvatar(File file) async { // load file to db and get url
    await Future.delayed(Duration(milliseconds: 1), () {});
    return 'url';
  }
}
