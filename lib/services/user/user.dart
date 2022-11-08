import 'dart:convert';

import 'package:interunesp_war/model/model.dart';
import 'package:interunesp_war/services/services.dart';

const userDataKey = "K_USER_DATA";

class UserService {
  const UserService({required this.storageService});
  factory UserService.base() {
    return UserService(storageService: StorageService());
  }

  final StorageService storageService;

  Future<void> update(User user) async {
    return storageService.set(userDataKey, jsonEncode(user.toJson()));
  }

  Future<User?> get() async {
    final String? persistedUserJson = await storageService.get(userDataKey);
    if (persistedUserJson == null) {
      return null;
    }
    return User.fromJson(jsonDecode(persistedUserJson));
  }

  Future<bool> hasUser() async {
    final user = await get();
    return user != null;
  }
}
