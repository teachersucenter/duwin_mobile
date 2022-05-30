import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String cover;
  final DateTime birth;
  final DateTime death;
  final String description;

  Author(this.id, this.createdAt, this.updatedAt, this.name, this.cover,
      this.birth, this.death, this.description);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
