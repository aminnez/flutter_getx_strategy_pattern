import 'package:get/get.dart';

import '../../../infrastructure/constants.dart';
import '../models/delete_dto.dart';
import '../models/user_model.dart';

class UserListRepository {
  Future<List<UserModel>?> getUsers() async {
    List<UserModel> users = [];
    await Future.delayed(const Duration(milliseconds: 2000));
    final GetConnect connect = GetConnect();
    final response = await connect.get<List<dynamic>>(
      Constants.getUsersUrl,
    );
    if (response.body != null) {
      users =
          response.body!.map((final user) => UserModel.fromJson(user)).toList();
    }
    return users;
  }

  Future<bool> deleteUser(final DeleteDto dto) async {
    final GetConnect connect = GetConnect();
    final response = await connect.delete(
      Constants.deleteUserUrl(dto.id),
    );
    return response.statusCode == 200;
  }
}
