import 'user.dart';
import 'message.dart';

class Dialog {
  final String id;
  final List<String> participants;
  String? lastMessage;
  int unreadCount;
  final String? botId;
  final List<Message> messages;

  Dialog({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.unreadCount = 0,
    this.botId,
    required this.messages,
  });

  factory Dialog.fromJson(Map<String, dynamic> json, String id) {
    return Dialog(
      id: id ?? '',
      participants: List<String>.from(json['participants']),
      lastMessage: json['lastMessage'],
      unreadCount: json['unreadCount'] ?? 0,
      botId: json['botId'],
      messages: List<Message>.from(
          json['messages'].map((messageJson) => Message.fromJson(messageJson))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participants': participants,
      'lastMessage': lastMessage,
      'unreadCount': unreadCount,
      'botId': botId,
      'messages': messages.map((message) => message.toJson()).toList(),
    };
  }
}
