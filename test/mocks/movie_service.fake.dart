// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:finance_house_task/model/movie/movie.dart';
//
// const response = {
//   "adult": false,
//   "backdrop_path": "/18TSJF1WLA4CkymvVUcKDBwUJ9F.jpg",
//   "genre_ids": [27, 53, 9648],
//   "id": 1034541,
//   "original_language": "en",
//   "original_title": "Terrifier 3",
//   "overview":
//       "Five years after surviving Art the Clown's Halloween massacre, Sienna and Jonathan are still struggling to rebuild their shattered lives. As the holiday season approaches, they try to embrace the Christmas spirit and leave the horrors of the past behind. But just when they think they're safe, Art returns, determined to turn their holiday cheer into a new nightmare. The festive season quickly unravels as Art unleashes his twisted brand of terror, proving that no holiday is safe.",
//   "popularity": 2614.762,
//   "poster_path": "/l1175hgL5DoXnqeZQCcU3eZIdhX.jpg",
//   "release_date": "2024-10-09",
//   "title": "Terrifier 3",
//   "video": false,
//   "vote_average": 6.9,
//   "vote_count": 923
// };
//
// // Generate mock classes for MovieService and FavMovieService
// @GenerateMocks([MovieService])
// class MovieService {
//   // @override
//   Future<Map<String, dynamic>?> getPopularMovies({int pageNo=1}) async {
//     print("object");
//     return Future.value({
//       "data": [Movie.fromJson(response)],
//       "page": 1
//     });
//   }
//   //
//   // Future<Map<String, dynamic>?> getNowPlaying() async {
//   //   return Future.value({
//   //     "data": [Movie.fromJson(response)],
//   //     "page": 1
//   //   });
//   // }
//   //
//   // Future<Map<String, dynamic>?> getTopRated() async {
//   //   return Future.value({
//   //     "data": [Movie.fromJson(response)],
//   //     "page": 1
//   //   });
//   // }
// }
