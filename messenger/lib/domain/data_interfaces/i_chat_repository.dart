import 'package:messenger/domain/entities/dialog.dart';
import 'package:messenger/domain/entities/user.dart';

abstract class IChatRepository {
  Future<List<User>> getUserList();
  Future<List<User>> getUserListByName({String? name});
  Future<User?> getUserByPhone({String? phone});
  Future<User?> getUserById({String? id});
  Future<String?> createDialog(String userId);
  Future<void> deleteDialog(String id);
  Future<List<Dialog>> getDialogs();
  Future<Dialog> addBot(String botId);
  Future<void> sendMessage(String dialogId, String message);
  Future<void> openDialog(String dialogId, Function(Dialog) onChange);
  Future<String?> getDialogByUser(String userId);
}
