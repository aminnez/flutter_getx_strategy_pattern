class EditUserDto {
  String name;
  String family;
  String phone;

  EditUserDto({
    required final this.name,
    required final this.family,
    required final this.phone,
  });

  factory EditUserDto.fromJson(final Map<String, dynamic> json) {
    final String _name = json['name'];
    final String _family = json['family'];
    final String _phone = json['phone'];
    return EditUserDto(
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

  EditUserDto copyWith({
    final String? name,
    final String? family,
    final String? phone,
  }) =>
      EditUserDto(
        name: name ?? this.name,
        family: family ?? this.family,
        phone: phone ?? this.phone,
      );
}
