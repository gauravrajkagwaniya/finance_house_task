import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_company.g.dart';

@JsonSerializable()
@Embedded()

class ProductionCompany {
  late int? id;

  @JsonKey(name:"name")
  late String? name;

  @JsonKey(name:"logo_path")
  late String? logoPath;

  @JsonKey(name:"origin_country")
  late String? originCountry;


  ProductionCompany({this.id});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}