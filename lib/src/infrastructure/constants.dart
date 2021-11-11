class Constants {
  static const String baseUrl = 'http://192.168.7.216:3000';
  static const String addUserUrl = '$baseUrl/users/';
  static const String getUsersUrl = '$baseUrl/users/';
  static String getUserUrl(final int id) => '$baseUrl/users/$id';
  static String editUserUrl(final int id) => '$baseUrl/users/$id';
  static String deleteUserUrl(final int id) => '$baseUrl/users/$id';
}
