import 'package:get/get.dart';

import '../../infrastructure/constants.dart';
import '../models/edit_user_dto.dart';
import '../models/user_model.dart';

class EditRepository {
  Future<UserModel?> getUsers(final int id) async {
    UserModel? user;
    await Future.delayed(const Duration(milliseconds: 2000));
    final GetConnect connect = GetConnect();
    final response = await connect.get<Map<String, dynamic>>(
      Constants.getUserUrl(id),
    );
    if (response.body != null) {
      user = UserModel.fromJson(response.body as Map<String, dynamic>);
    }
    return user;
  }

  Future<UserModel?> editUser(final int userId, final EditUserDto user) async {
    await Future.delayed(const Duration(milliseconds: 2000));

    final GetConnect connect = GetConnect();
    final response = await connect.put<Map<String, dynamic>>(
      Constants.editUserUrl(userId),
      user.toJson(),
    );
    if (response.body != null) {
      return UserModel.fromJson(response.body!);
    }
    return null;
  }
}
