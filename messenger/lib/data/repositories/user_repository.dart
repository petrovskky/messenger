import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:messenger/data/utils/constants.dart';
import 'package:messenger/domain/data_interfaces/i_user_repository.dart';
import 'package:messenger/domain/entities/user.dart';

class UserRepository implements IUserRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  String? userId;
  StreamSubscription? _userSubscription;

  UserRepository(
      {required this.firebaseFirestore, required this.firebaseStorage});

  @override
  void init(String? email, Function(User) onUserChanged,
      Function(String) onUserDeleted) {
    updateUserStatus(true);
    firebaseFirestore
        .collection(usersPath)
        .where('email', isEqualTo: email)
        .limit(1)
        .get()
        .then((user) {
      userId = user.docs.first.id;
      _userSubscription = firebaseFirestore
          .collection(usersPath)
          .doc(userId)
          .snapshots()
          .listen((snapshot) {
        if (snapshot.exists) {
          onUserChanged(User.fromJson(snapshot.data()!, userId));
        } else {
          if (!snapshot.exists) {
            onUserDeleted('User was deleted');
          }
        }
      });
    });
  }

  void dispose() {
    updateUserStatus(false);
    _userSubscription?.cancel();
  }

  @override
  Future<User> getUser() async {
    final snapshot =
        await firebaseFirestore.collection(usersPath).doc(userId).get();
    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!, userId);
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<void> updateUser(
      {String? name,
      String? phone,
      DateTime? birthday,
      String? photoUrl}) async {
    try {
      final userDocRef = firebaseFirestore.collection(usersPath).doc(userId);

      final userDoc = await userDocRef.get();
      if (userDoc.exists) {
        final data = userDoc.data()!;
        final updatedData = {
          'name': name ?? data['name'],
          'phone': phone ?? data['phone'],
          'birthday': birthday?.toIso8601String() ?? data['birthday'],
          'photoUrl': photoUrl ?? data['photoUrl'],
        };

        await userDocRef.update(updatedData);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  @override
  Future<void> updateUserStatus(bool isActive) async {
    try {
      final userDocRef = firebaseFirestore.collection(usersPath).doc(userId);

      final userDoc = await userDocRef.get();
      if (userDoc.exists) {
        await userDocRef.update({'isActive': isActive});
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      print('Error updating user status: $e');
    }
  }

  @override
  Future<String?> loadAvatar(File file) async {
    try {
      final storageRef = firebaseStorage.ref().child(
          'avatars/${userId}${DateFormat('yyyyMMddHHmmss').format(DateTime.now())}_avatar.jpg');
      final uploadTask = storageRef.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error loading user photo: $e');
    }
    return null;
  }
}
