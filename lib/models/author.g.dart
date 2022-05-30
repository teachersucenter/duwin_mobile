// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      json['id'] as int,
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
      json['name'] as String,
      json['cover'] as String,
      DateTime.parse(json['birth'] as String),
      DateTime.parse(json['death'] as String),
      json['description'] as String,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'cover': instance.cover,
      'birth': instance.birth.toIso8601String(),
      'death': instance.death.toIso8601String(),
      'description': instance.description,
    };
