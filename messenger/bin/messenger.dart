import 'dart:convert';
import 'dart:io';

import 'package:messenger/data/repositories/auth_repository.dart';
import 'package:messenger/data/repositories/chat_repository.dart';
import 'package:messenger/data/repositories/dialog_repository.dart';
import 'package:messenger/data/repositories/user_repository.dart';
import 'package:messenger/domain/entities/dialog.dart';
import 'package:messenger/domain/entities/user.dart';

void main() async {
  while (true) {
    String userId;
    while (true) {
      print("========= Sign in =========");
      print("Email:");
      final email = stdin.readLineSync(encoding: utf8);
      print("Password:");
      final password = stdin.readLineSync(encoding: utf8);
      final authRepo = AuthRepository();
      String? id = await authRepo.signIn(email ?? '', password ?? '');
      if (id == null) {
        print("Sign in fail. No such a user.");
        continue;
      }
      userId = id;
      break;
    }
    final userRepository = UserRepository(token: "token", id: userId);
    User user = await userRepository.getUser();
    final chatRepository = ChatRepository(id: user.id);
    print("========= Successful sign in =========");
    while (true) {
        print("Choose option:");
    print("Dialogs -> 1");
    print("Profile -> 2");
    print("Settings -> 3");
    final option = stdin.readLineSync(encoding: utf8);
    switch (option) {
      case '1':
        final dialogs = await chatRepository.getDialogs();
        var i = 0;
        for (var d in dialogs) {
          print("Dialog ${++i}");
          for (var u in d.participants) {
            print(u.name);
          }
        }
    }
    print("Choose dialog:");
    final _ = stdin.readLineSync(encoding: utf8);
    final dialogRepository = DialogRepository(token: 'token', id: '0');
    var messages = await dialogRepository.getMessageListByDialog('0');
    print('');
    for (var m in messages) {
      print('${m.senderId}: ${m.text}');
    }
    while (true) {
      print("Send:");
      final msg = stdin.readLineSync(encoding: utf8);

      if (msg == '-1') {
        break;
      }

      dialogRepository.sendMessage('0', msg!);
      messages = await dialogRepository.getMessageListByDialog('0');
      print('');
      for (var m in messages) {
        print('${m.senderId}: ${m.text}');
      }
    }
    }
    
  }
}
