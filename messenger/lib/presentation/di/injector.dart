import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:messenger/data/data_sources/interfaces/i_preference_data_source.dart';
import 'package:messenger/data/data_sources/preference_data_source.dart';
import 'package:messenger/data/repositories/auth_repository.dart';
import 'package:messenger/domain/data_interfaces/i_auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup(FirebaseAuth firebaseAuth, FirebaseFirestore firebaseFirestore, SharedPreferences prefs) {
  getIt.registerSingleton<IAuthRepository>(AuthRepository(
    firebaseAuth: firebaseAuth,
    firebaseFirestore: firebaseFirestore,
  ));
  getIt.registerSingleton<IPreferenceDataSource>(PreferenceDataSource(prefs));
}
