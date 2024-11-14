import 'package:finance_house_task/model/movie/genre.dart';
import 'package:finance_house_task/model/movie/production_company.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/enum.dart';

part 'movie.g.dart';

@JsonSerializable()
@collection
class Movie {
  Id id = Isar.autoIncrement;

  // late int id;

  @JsonKey(name: "release_date")
  late String? releaseDate;

  @JsonKey(name: "overview")
  late String? overview;

  @JsonKey(name: "original_language")
  late String? originalLanguage;

  @JsonKey(name: "poster_path")
  late String? posterPath;

  @JsonKey(name: "title")
  late String? title;

  @JsonKey(name: "vote_average")
  late double? voteAverage;

  @JsonKey(name: "vote_count")
  late double? voteCount;

  @JsonKey(name: "backdrop_path")
  late String? backdropPath;

  late List<Genre>? genres;

  @JsonKey(name: "production_companies")
  late List<ProductionCompany>? productionCompanies;
  late bool? isFav;
  @enumerated
  late MovieSectionsEnum movieCategoryEnum;

  Movie({required this.id, this.movieCategoryEnum = MovieSectionsEnum.favoriteMovie});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
