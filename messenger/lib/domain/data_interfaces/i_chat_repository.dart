import 'package:messenger/domain/entities/dialog.dart';
import 'package:messenger/domain/entities/user.dart';

abstract class IChatRepository {
  Future<List<User>> getUserList();
  Future<List<User>> getUserListByName({String? name});
  Future<User?> getUserByPhone({String? phone});
  Future<User?> getUserById({String? id});
  Future<Dialog?> createDialog(String userId);
  Future<void> deleteDialog(String id);
  Future<List<Dialog>> getDialogs();
  Future<Dialog> addBot(String botId);
}
