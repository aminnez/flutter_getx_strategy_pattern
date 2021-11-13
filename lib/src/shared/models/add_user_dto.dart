class AddUserDto {
  String name;
  String family;
  String phone;

  AddUserDto({
    required final this.name,
    required final this.family,
    required final this.phone,
  });

  factory AddUserDto.fromJson(final Map<String, dynamic> json) {
    final String _name = json['name'];
    final String _family = json['family'];
    final String _phone = json['phone'];
    return AddUserDto(
      name: _name,
      family: _family,
      phone: _phone,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['family'] = family;
    map['phone'] = phone;
    return map;
  }

  AddUserDto copyWith({
    final String? name,
    final String? family,
    final String? phone,
  }) =>
      AddUserDto(
        name: name ?? this.name,
        family: family ?? this.family,
        phone: phone ?? this.phone,
      );
}
