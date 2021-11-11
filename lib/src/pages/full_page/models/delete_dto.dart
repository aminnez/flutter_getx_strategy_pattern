class DeleteDto {
  final int id;

  DeleteDto(this.id);

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  factory DeleteDto.fromJson(final Map<String, dynamic> map) => DeleteDto(
        map['id'] as int,
      );
}
