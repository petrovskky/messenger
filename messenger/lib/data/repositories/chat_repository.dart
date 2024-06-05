import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger/domain/data_interfaces/i_auth_repository.dart';
import 'package:messenger/domain/data_interfaces/i_chat_repository.dart';
import 'package:messenger/domain/data_interfaces/i_user_repository.dart';
import 'package:messenger/domain/entities/dialog.dart';
import 'package:messenger/domain/entities/message.dart';
import 'package:messenger/domain/entities/user.dart';
import 'package:messenger/presentation/di/injector.dart';

class ChatRepository implements IChatRepository {
  final IUserRepository userRepository;
  final FirebaseFirestore firebaseFirestore;

  ChatRepository(
      {required this.userRepository, required this.firebaseFirestore});

  StreamSubscription? _dialogSubscription;

  @override
  Future<List<User>> getUserList() async {
    final email = getIt.get<IAuthRepository>().userEmail;
    final querySnapshot = await firebaseFirestore.collection('users').get();
    final userList = querySnapshot.docs
        .map((doc) => User.fromJson(doc.data(), doc.id))
        .where((user) => user.email != email)
        .toList();
    return userList;
  }

  @override
  Future<List<User>> getUserListByName({String? name}) async {
    return [];
  }

  @override
  Future<User?> getUserByPhone({String? phone}) async {
    return null;
  }

  @override
  Future<User?> getUserById({String? id}) async {
    return null;
  }

  @override
  Future<String?> createDialog(String userId) async {
    try {
      final email = getIt.get<IAuthRepository>().userEmail;
      final querySnapshot = await firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      final mineId = querySnapshot.docs.first.id;

      final dialogRef = await firebaseFirestore.collection('dialogs').add({
        'participants': [mineId, userId],
        'messages': [],
      });
      return dialogRef.id;
    } catch (e) {
      print('Error creating dialog: $e');
      return null;
    }
  }

  @override
  Future<void> sendMessage(String dialogId, String message) async {
    try {
      await firebaseFirestore.collection('dialogs').doc(dialogId).update({
        'messages': FieldValue.arrayUnion([
          Message(
            isMine: true,
            text: message,
            dateTime: DateTime.now(),
          ).toJson(),
        ]),
      });
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  @override
  Future<void> deleteDialog(String id) async {}

  @override
  Future<List<Dialog>> getDialogs() async {
    try {
      final email = getIt.get<IAuthRepository>().userEmail;
      final querySnapshot = await firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      final userId = querySnapshot.docs.first.id;

      final dialogSnapshot = await firebaseFirestore
          .collection('dialogs')
          .where('participants', arrayContains: userId)
          .get();
      final dialogList = dialogSnapshot.docs
          .map((doc) => Dialog.fromJson(doc.data(), doc.id))
          .toList();

      return dialogList;
    } catch (e) {
      print('Error getting dialogs: $e');
      return [];
    }
  }

  @override
  Future<void> openDialog(String dialogId, Function(Dialog) onChange) async {
    try {
      _dialogSubscription?.cancel();
      final dialogRef = firebaseFirestore.collection('dialogs').doc(dialogId);
      _dialogSubscription = dialogRef.snapshots().listen((snapshot) {
        if (snapshot.data() != null) {
          final dialog = Dialog.fromJson(snapshot.data()!, snapshot.id);
          onChange(dialog);
        }
      });
    } catch (e) {
      print('Error opening dialog: $e');
    }
  }

  @override
  Future<String?> getDialogByUser(String userId) async {
    try {
      final dialogSnapshot = await firebaseFirestore
          .collection('dialogs')
          .where('participants', arrayContains: userId)
          .get();
      if (dialogSnapshot.docs.isNotEmpty) {
        final email = getIt.get<IAuthRepository>().userEmail;
        final querySnapshot = await firebaseFirestore
            .collection('users')
            .where('email', isEqualTo: email)
            .get();
        final mineId = querySnapshot.docs.first.id;

        final dialogs = dialogSnapshot.docs
            .where((doc) => doc.data()['participants'].contains(mineId));
        if (dialogs.isNotEmpty) {
          final dialogId = dialogs.first.id;
          return dialogId;
        }
      }
    } catch (e) {
      print('Error getting dialog by user: $e');
    }
    return null;
  }

  @override
  Future<Dialog> addBot(String botId) async {
    return Dialog(id: '0', participants: [], botId: botId, messages: []);
    /*final user = await getUserById(id: _id);
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
    return dialogWithBot;*/
  }
}
