// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['id'] as int,
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
      json['title'] as String,
      DateTime.parse(json['publishedDate'] as String),
      json['shortDescription'] as String,
      json['longDescription'] as String,
      json['length'] as int,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'title': instance.title,
      'publishedDate': instance.publishedDate.toIso8601String(),
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'length': instance.length,
    };
