import 'package:messenger/data/utils/fake_db.dart';
import 'package:messenger/domain/data_interfaces/i_chat_repository.dart';
import 'package:messenger/domain/entities/dialog.dart';
import 'package:messenger/domain/entities/user.dart';

class ChatRepository implements IChatRepository {
  //final String _token;
  final String _id;

  ChatRepository({required String id}) : _id = id;

  @override
  Future<List<User>> getUserList() async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return userList;
  }

  @override
  Future<List<User>> getUserListByName({String? name}) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return userList.where((e) => e.name.contains(name ?? '')).toList();
  }

  @override
  Future<User?> getUserByPhone({String? phone}) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return userList
        .cast<User?>()
        .firstWhere((e) => e?.phone == phone, orElse: (() => null));
  }

  @override
  Future<User?> getUserById({String? id}) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return userList
        .cast<User?>()
        .firstWhere((e) => e?.id == id, orElse: (() => null));
  }

  @override
  Future<Dialog?> createDialog(String userId) async {
    final firstUser = await getUserById(id: _id);
    final secondUser = await getUserById(id: userId);
    bool alreadyExists = false;
    if (firstUser == null || secondUser == null) {
      return null;
    }
    var dialog = dialogList.cast<Dialog?>().firstWhere(
          (e) =>
              (e?.participants.where((p) => p.id == _id).isNotEmpty ?? false) &&
              (e?.participants.where((p) => p.id == userId).isNotEmpty ??
                  false),
          orElse: (() => null),
        );
    if (dialog != null) alreadyExists = true;
    dialog ??= Dialog(
      id: dialogList.length.toString(),
      participants: [
        firstUser,
        secondUser,
      ],
    );
    if (!alreadyExists) dialogList.add(dialog);
    return dialog;
  }

  @override
  Future<void> deleteDialog(String id) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    messageList.removeWhere((e) => e.dialogId == id);
    dialogList.removeWhere((e) => e.id == id);
  }

  @override
  Future<List<Dialog>> getDialogs() async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return dialogList;
  }

  @override
  Future<Dialog> addBot(String botId) async {
    final user = await getUserById(id: _id);
    bool alreadyExists = false;
    var dialogWithBot = dialogList.cast<Dialog?>().firstWhere(
          (e) =>
              (e?.participants.where((p) => p.id == _id).isNotEmpty ?? false) &&
              (e?.botId == botId),
          orElse: (() => null),
        );
    if (dialogWithBot != null) alreadyExists = true;
    dialogWithBot ??= Dialog(
      id: dialogList.length.toString(),
      participants: [
        user!, // this user is me, so it can not be null
      ],
      botId: botId,
    );
    if (!alreadyExists) dialogList.add(dialogWithBot);
    return dialogWithBot;
  }
}
