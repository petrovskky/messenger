import 'package:messenger/domain/entities/bot.dart';
import 'package:messenger/domain/entities/dialog.dart';
import 'package:messenger/domain/entities/message.dart';
import 'package:messenger/domain/entities/user.dart';

List<User> userList = [
  User(
    id: '0',
    name: 'User A',
    email: 'user_a@gmail.com',
    isActive: true,
    phone: '1111111',
  ),
  User(
    id: '1',
    name: 'User B',
    email: 'user_b@gmail.com',
    isActive: true,
    phone: '2222222',
  ),
  User(
    id: '2',
    name: 'User C',
    email: 'user_c@gmail.com',
    isActive: false,
    phone: '3333333',
  ),
  User(
    id: '3',
    name: 'User D',
    email: 'user_d@gmail.com',
    isActive: true,
    phone: '4444444',
  ),
  User(
    id: '4',
    name: 'User B',
    email: 'user_b_2@gmail.com',
    isActive: false,
    phone: '5555555',
  ),
];

final dialogList = [
  Dialog(
    id: '0',
    participants: [
      userList[0],
      userList[1],
    ],
    lastMessage: messageList[0],
    unreadCount: 5,
  ),
  Dialog(
    id: '1',
    participants: [
      userList[0],
      userList[2],
    ],
    lastMessage: messageList[1],
    unreadCount: 3,
  ),
  Dialog(
    id: '2',
    participants: [
      userList[0],
      userList[3],
    ],
    lastMessage: messageList[2],
    unreadCount: 7,
  ),
];

final messageList = [
  Message(
    id: '0',
    dialogId: '0',
    senderId: '3',
    dateTime: DateTime.parse('2024-03-25 15:45:21.710'),
    text: 'First message',
  ),
  Message(
    id: '0',
    dialogId: '0',
    senderId: '0',
    dateTime: DateTime.parse('2024-03-25 15:45:21.710'),
    text: 'Hello User D!',
  ),
  Message(
    id: '1',
    dialogId: '4',
    senderId: '1',
    dateTime: DateTime.parse('2024-03-25 10:30:03.710'),
  ),
  Message(
    id: '2',
    dialogId: '3',
    senderId: '3',
    dateTime: DateTime.parse('2024-03-25 17:47:21.710'),
  ),
  Message(
    id: '0',
    dialogId: '4',
    senderId: '4',
    dateTime: DateTime.parse('2024-03-25 13:31:03.710'),
  ),
  Message(
    id: '1',
    dialogId: '3',
    senderId: '1',
    dateTime: DateTime.parse('2024-03-25 15:51:21.710'),
  ),
  Message(
    id: '2',
    dialogId: '1',
    senderId: '1',
    dateTime: DateTime.parse('2024-03-25 19:17:03.710'),
  ),
];

final botList = [
  Bot(
    id: '0',
    name: 'Bot 1',
    description: 'Funny bot for jokes',
  ),
  Bot(
    id: '1',
    name: 'Bot 2',
    description: 'Clever bot for science facts',
  ),
  Bot(
    id: '2',
    name: 'Bot 3',
    description: 'Modern bot for news',
  ),
];
