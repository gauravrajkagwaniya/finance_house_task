
import 'package:json_annotation/json_annotation.dart';

part 'trailer.g.dart';

@JsonSerializable()
class Trailer {


  late String? id;

  @JsonKey(name:"iso_639_1")
  late String? isoSix;

  @JsonKey(name:"iso_3166_1")
  late String? isoThree;

  @JsonKey(name:"name")
  late String? name;

  @JsonKey(name:"key")
  late String? key;

  @JsonKey(name:"site")
  late String? site;

  @JsonKey(name:"size")
  late int? size;

  @JsonKey(name:"type")
  late String? type;

  @JsonKey(name:"official")
  late bool? official;

  @JsonKey(name:"published_at")
  late String? published_at;



  Trailer({required this.id});

  factory Trailer.fromJson(Map<String, dynamic> json) => _$TrailerFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}