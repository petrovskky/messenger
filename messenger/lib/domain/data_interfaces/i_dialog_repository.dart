import 'package:messenger/domain/entities/message.dart';

abstract class IDialogRepository {
  Future<List<Message>> getMessageListByDialog(String id);
  Future<Message> sendMessage(String dialogId, String text, {List<String>? files, List<String>? photos});
  Future<String> translateMessage(String text, String language);
  Future<Message?> editMessage(String id, {String? text, List<String>? files, List<String>? photos});
  Future<void> deleteMessage(String id);
}
