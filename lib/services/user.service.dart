import 'dart:convert';

import 'package:inter_war/model/model.dart';
import 'package:inter_war/services/services.dart';

const userDataKey = "K_USER_DATA";

class UserService {
  const UserService({required this.storageService});
  factory UserService.base() {
    return UserService(storageService: StorageService());
  }

  final StorageService storageService;

  Future<void> update(User? user) {
    return storageService.set(userDataKey, jsonEncode(user?.toJson()));
  }

  Future<void> logout() {
    return storageService.remove(userDataKey);
  }

  Future<User?> get() async {
    final String? persistedUserJson = await storageService.get(userDataKey);
    if (persistedUserJson == null) {
      return null;
    }
    return User.fromJson(jsonDecode(persistedUserJson));
  }

  Future<void> addKiss(Kiss kiss) async {
    final user = await get();
    if (user != null) {
      user.kisses.add(kiss);

      return await update(user);
    }

    throw "user does not exists";
  }
}
