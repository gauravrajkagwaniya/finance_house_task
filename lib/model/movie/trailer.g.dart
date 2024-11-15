// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      id: json['id'] as String?,
    )
      ..isoSix = json['iso_639_1'] as String?
      ..isoThree = json['iso_3166_1'] as String?
      ..name = json['name'] as String?
      ..key = json['key'] as String?
      ..site = json['site'] as String?
      ..size = (json['size'] as num?)?.toInt()
      ..type = json['type'] as String?
      ..official = json['official'] as bool?
      ..publishedAt = json['published_at'] as String?;

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.isoSix,
      'iso_3166_1': instance.isoThree,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
    };
