import 'user.dart';
import 'message.dart';

class Dialog {
  final String id;
  final List<String> participants;
  String? lastMessage;
  int unreadCount;
  final String? botId;

  Dialog({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.unreadCount = 0,
    this.botId,
  });

  factory Dialog.fromJson(Map<String, dynamic> json) {
    return Dialog(
      id: json['id'],
      participants: List<String>.from(json['participants']),
      lastMessage: json['lastMessage'],
      unreadCount: json['unreadCount'],
      botId: json['botId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participants': participants,
      'lastMessage': lastMessage,
      'unreadCount': unreadCount,
      'botId': botId,
    };
  }
}
