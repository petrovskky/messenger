import 'package:messenger/data/utils/fake_db.dart';
import 'package:messenger/domain/data_interfaces/i_dialog_repository.dart';
import 'package:messenger/domain/entities/message.dart';

class DialogRepository implements IDialogRepository {
  //final String _token;
  final String _id;

  DialogRepository({required String token, required String id}) : _id = id;

  @override
  Future<void> deleteMessage(String id) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    messageList.removeWhere((e) => e.id == id);
  }

  @override
  Future<Message?> editMessage(String id,
      {String? text, List<String>? files, List<String>? photos}) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    final message = messageList
        .cast<Message?>()
        .firstWhere((e) => e?.id == id, orElse: (() => null));
    message?.edit(newText: text, newFiles: files, newPhotos: photos);
    return message;
  }

  @override
  Future<List<Message>> getMessageListByDialog(String id) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return messageList.where((e) => e.dialogId == id).toList();
  }

  @override
  Future<Message> sendMessage(
    String dialogId,
    String text, {
    List<String>? files,
    List<String>? photos,
  }) async {
    final message = Message(
      id: messageList.length.toString(),
      dialogId: dialogId,
      senderId: _id,
      dateTime: DateTime.now(),
      text: text,
    );
    messageList.add(message);
    return message;
  }

  @override
  Future<String> translateMessage(String text, String language) async {
    await Future.delayed(Duration(milliseconds: 1), () {});
    return text;
  }
}
