import 'user.dart';
import 'message.dart';

class Dialog {
  final String id;
  final List<User> participants;
  Message? lastMessage;
  int unreadCount;
  final String? botId;

  Dialog({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.unreadCount = 0,
    this.botId,
  });

  List<User> getParticipants() {
    return participants;
  }

  Message? getLastMessage() {
    return lastMessage;
  }

  int getUnreadCount() {
    return unreadCount;
  }
}
