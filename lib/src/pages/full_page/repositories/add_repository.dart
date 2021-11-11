import 'package:get/get.dart';

import '../../../infrastructure/constants.dart';
import '../models/add_user_dto.dart';
import '../models/user_model.dart';

class AddRepository {
  Future<UserModel?> addUser(final AddUserDto user) async {
    await Future.delayed(const Duration(milliseconds: 2000));

    final GetConnect connect = GetConnect();
    final response = await connect.post<Map<String, dynamic>>(
      Constants.addUserUrl,
      user.toJson(),
    );
    if (response.body != null) {
      return UserModel.fromJson(response.body!);
    }
    return null;
  }
}
