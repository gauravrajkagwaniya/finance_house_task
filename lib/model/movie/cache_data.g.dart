// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCacheDataCollection on Isar {
  IsarCollection<CacheData> get cacheDatas => this.collection();
}

const CacheDataSchema = CollectionSchema(
  name: r'CacheData',
  id: 1522824546206685093,
  properties: {
    r'apiUrl': PropertySchema(
      id: 0,
      name: r'apiUrl',
      type: IsarType.string,
    ),
    r'movieCategoryEnum': PropertySchema(
      id: 1,
      name: r'movieCategoryEnum',
      type: IsarType.byte,
      enumMap: _CacheDatamovieCategoryEnumEnumValueMap,
    ),
    r'response': PropertySchema(
      id: 2,
      name: r'response',
      type: IsarType.string,
    )
  },
  estimateSize: _cacheDataEstimateSize,
  serialize: _cacheDataSerialize,
  deserialize: _cacheDataDeserialize,
  deserializeProp: _cacheDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cacheDataGetId,
  getLinks: _cacheDataGetLinks,
  attach: _cacheDataAttach,
  version: '3.1.0+1',
);

int _cacheDataEstimateSize(
  CacheData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.apiUrl.length * 3;
  bytesCount += 3 + object.response.length * 3;
  return bytesCount;
}

void _cacheDataSerialize(
  CacheData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apiUrl);
  writer.writeByte(offsets[1], object.movieCategoryEnum.index);
  writer.writeString(offsets[2], object.response);
}

CacheData _cacheDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CacheData();
  object.apiUrl = reader.readString(offsets[0]);
  object.id = id;
  object.movieCategoryEnum = _CacheDatamovieCategoryEnumValueEnumMap[
          reader.readByteOrNull(offsets[1])] ??
      MovieSectionsEnum.popularMovies;
  object.response = reader.readString(offsets[2]);
  return object;
}

P _cacheDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_CacheDatamovieCategoryEnumValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MovieSectionsEnum.popularMovies) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CacheDatamovieCategoryEnumEnumValueMap = {
  'popularMovies': 0,
  'nowPlaying': 1,
  'topRatedMovies': 2,
  'favoriteMovie': 3,
};
const _CacheDatamovieCategoryEnumValueEnumMap = {
  0: MovieSectionsEnum.popularMovies,
  1: MovieSectionsEnum.nowPlaying,
  2: MovieSectionsEnum.topRatedMovies,
  3: MovieSectionsEnum.favoriteMovie,
};

Id _cacheDataGetId(CacheData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cacheDataGetLinks(CacheData object) {
  return [];
}

void _cacheDataAttach(IsarCollection<dynamic> col, Id id, CacheData object) {
  object.id = id;
}

extension CacheDataQueryWhereSort
    on QueryBuilder<CacheData, CacheData, QWhere> {
  QueryBuilder<CacheData, CacheData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CacheDataQueryWhere
    on QueryBuilder<CacheData, CacheData, QWhereClause> {
  QueryBuilder<CacheData, CacheData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CacheDataQueryFilter
    on QueryBuilder<CacheData, CacheData, QFilterCondition> {
  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apiUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apiUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> apiUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apiUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition>
      movieCategoryEnumEqualTo(MovieSectionsEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'movieCategoryEnum',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition>
      movieCategoryEnumGreaterThan(
    MovieSectionsEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'movieCategoryEnum',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition>
      movieCategoryEnumLessThan(
    MovieSectionsEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'movieCategoryEnum',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition>
      movieCategoryEnumBetween(
    MovieSectionsEnum lower,
    MovieSectionsEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'movieCategoryEnum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> responseEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'response',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> responseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'response',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> responseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'response',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> responseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'response',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> responseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'response',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> responseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'response',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> responseContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'response',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> responseMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'response',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition> responseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'response',
        value: '',
      ));
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterFilterCondition>
      responseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'response',
        value: '',
      ));
    });
  }
}

extension CacheDataQueryObject
    on QueryBuilder<CacheData, CacheData, QFilterCondition> {}

extension CacheDataQueryLinks
    on QueryBuilder<CacheData, CacheData, QFilterCondition> {}

extension CacheDataQuerySortBy on QueryBuilder<CacheData, CacheData, QSortBy> {
  QueryBuilder<CacheData, CacheData, QAfterSortBy> sortByApiUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiUrl', Sort.asc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> sortByApiUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiUrl', Sort.desc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> sortByMovieCategoryEnum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieCategoryEnum', Sort.asc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy>
      sortByMovieCategoryEnumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieCategoryEnum', Sort.desc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> sortByResponse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'response', Sort.asc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> sortByResponseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'response', Sort.desc);
    });
  }
}

extension CacheDataQuerySortThenBy
    on QueryBuilder<CacheData, CacheData, QSortThenBy> {
  QueryBuilder<CacheData, CacheData, QAfterSortBy> thenByApiUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiUrl', Sort.asc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> thenByApiUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiUrl', Sort.desc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> thenByMovieCategoryEnum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieCategoryEnum', Sort.asc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy>
      thenByMovieCategoryEnumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieCategoryEnum', Sort.desc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> thenByResponse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'response', Sort.asc);
    });
  }

  QueryBuilder<CacheData, CacheData, QAfterSortBy> thenByResponseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'response', Sort.desc);
    });
  }
}

extension CacheDataQueryWhereDistinct
    on QueryBuilder<CacheData, CacheData, QDistinct> {
  QueryBuilder<CacheData, CacheData, QDistinct> distinctByApiUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apiUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CacheData, CacheData, QDistinct> distinctByMovieCategoryEnum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'movieCategoryEnum');
    });
  }

  QueryBuilder<CacheData, CacheData, QDistinct> distinctByResponse(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'response', caseSensitive: caseSensitive);
    });
  }
}

extension CacheDataQueryProperty
    on QueryBuilder<CacheData, CacheData, QQueryProperty> {
  QueryBuilder<CacheData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CacheData, String, QQueryOperations> apiUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apiUrl');
    });
  }

  QueryBuilder<CacheData, MovieSectionsEnum, QQueryOperations>
      movieCategoryEnumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'movieCategoryEnum');
    });
  }

  QueryBuilder<CacheData, String, QQueryOperations> responseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'response');
    });
  }
}
