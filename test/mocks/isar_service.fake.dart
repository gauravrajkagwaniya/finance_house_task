import 'package:finance_house_task/model/movie/movie.dart';
import 'package:finance_house_task/utils/util_methods.dart';
import 'package:mockito/annotations.dart';

// Generate mock classes for MovieService and FavMovieService
@GenerateMocks([IsarService])
class IsarService {
  Future<void> initializeIsar() async {
    UtilMethods.kPrintMessage("initializeIsar ");
  }


  Future<List<Movie>> getAllMovies()async{
    return [];
  }

  Future<void> deleteMovie(Movie movie) async {
    return;
  }

  Future<void> addMovie(Movie movie) async {
    return;
  }





}


