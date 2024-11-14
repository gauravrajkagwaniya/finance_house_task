import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
@Embedded()
class Genre {
  late int? id;

  late String? name;

  Genre({ this.id});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}