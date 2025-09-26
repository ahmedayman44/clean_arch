import 'dart:convert';

import 'package:clean_arch/core/databases/cache/cache_helper.dart';
import 'package:clean_arch/core/errors/expentions.dart';
import 'package:clean_arch/features/user/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cache;
  final String key = "CachUser";

  UserLocalDataSource({required this.cache});

  cachUser(UserModel? userToCach) {
    if (userToCach != null) {
      cache.saveData(key: key, value: json.encode(userToCach.toJson()));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<UserModel> getLastUser() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
