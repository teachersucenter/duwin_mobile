import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  final int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  DateTime publishedDate;
  String shortDescription;
  String longDescription;
  int length;

  Book(this.id, this.createdAt, this.updatedAt, this.title, this.publishedDate,
      this.shortDescription, this.longDescription, this.length);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
