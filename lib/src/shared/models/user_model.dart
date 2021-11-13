class UserModel {
  int id;
  String name;
  String family;
  String phone;

  UserModel({
    required final this.id,
    required final this.name,
    required final this.family,
    required final this.phone,
  });

  factory UserModel.fromJson(final Map<String, dynamic> json) {
    final int _id = json['id'];
    final String _name = json['name'];
    final String _family = json['family'];
    final String _phone = json['phone'];
    return UserModel(
      id: _id,
      name: _name,
      family: _family,
      phone: _phone,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['family'] = family;
    map['phone'] = phone;
    return map;
  }

  UserModel copyWith({
    final int? id,
    final String? name,
    final String? family,
    final String? phone,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        family: family ?? this.family,
        phone: phone ?? this.phone,
      );
}
