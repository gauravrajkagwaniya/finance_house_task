// Mocks generated by Mockito 5.4.4 from annotations
// in finance_house_task/test/mocks/isar_service.fake.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:finance_house_task/model/movie/movie.dart' as _i4;
import 'package:finance_house_task/utils/enum.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

import 'isar_service.fake.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [IsarService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIsarService extends _i1.Mock implements _i2.IsarService {
  MockIsarService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> initializeIsar() => (super.noSuchMethod(
        Invocation.method(
          #initializeIsar,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i4.Movie>> getAllMovies() => (super.noSuchMethod(
        Invocation.method(
          #getAllMovies,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Movie>>.value(<_i4.Movie>[]),
      ) as _i3.Future<List<_i4.Movie>>);

  @override
  _i3.Future<void> deleteMovie(_i4.Movie? movie) => (super.noSuchMethod(
        Invocation.method(
          #deleteMovie,
          [movie],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> addMovie(_i4.Movie? movie) => (super.noSuchMethod(
        Invocation.method(
          #addMovie,
          [movie],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> saveResToCache(
    _i5.MovieSectionsEnum? section,
    String? url,
    String? res,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveResToCache,
          [
            section,
            url,
            res,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<Map<String, dynamic>?> getResFromCache(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #getResFromCache,
          [url],
        ),
        returnValue: _i3.Future<Map<String, dynamic>?>.value(),
      ) as _i3.Future<Map<String, dynamic>?>);
}
