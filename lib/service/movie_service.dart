import 'dart:convert';
import 'dart:io';
import 'package:finance_house_task/service/cache_service.dart';
import 'package:finance_house_task/utils/enum.dart';
import '../global.dart';
import '../model/movie/movie.dart';
import '../model/movie/trailer.dart';

// Service class to interact with movie-related API endpoints
class MovieService extends APIService {
  MovieService();

  // Singleton pattern: Provides a single instance of MovieService
  factory MovieService.getInstance() => _instance;
  static final MovieService _instance = MovieService();

  // Function to fetch popular movies
  // Accepts a page number (default: 1) for pagination
  Future<Map<String, dynamic>?> getPopularMovies({int pageNo = 1}) async {
    // Parameters for the API request
    final parms = {"lang": "en-US", "page": pageNo.toString()};
    // Make GET request to the popular movies endpoint
    try {
      final response = await (get("/movie/popular", params: parms));
      if (pageNo == 1) {
        CacheService().saveResToCache(MovieSectionsEnum.popularMovies,
            "/movie/popular/$pageNo", jsonEncode(response));
      }
      return parsedObj(response);
    } on SocketException catch (e) {
      UtilMethods.showToast(e);
    } catch (e) {
      UtilMethods.showToast(e);
    } finally {
      if (pageNo == 1) {
        final response =
            await CacheService().getResFromCache(CacheService.popularDataKey);
        return parsedObj(response);
      }
    }
    return null;
  }

  // Function to fetch currently playing movies
  // Accepts a page number (default: 1) for pagination
  Future<Map<String, dynamic>?> getNowPlaying({int pageNo = 1}) async {
    final parms = {
      "lang": "en-US",
      "page": pageNo.toString()
    }; // Parameters for the API request
    try {
      final response = await (get("/movie/now_playing", params: parms));
      if (pageNo == 1) {
        CacheService().saveResToCache(MovieSectionsEnum.nowPlaying,
            "/movie/now_playing/$pageNo", jsonEncode(response));
      }
      return parsedObj(response);
    } on SocketException catch (e) {
      UtilMethods.showToast(e);
    } catch (e) {
      UtilMethods.showToast(e);
    } finally {
      if (pageNo == 1) {
        final response = await CacheService()
            .getResFromCache(CacheService.nowPlayingDataKey);
        return parsedObj(response);
      }
    }
    return null;
  }

  ///helper funtion to parse obj in different map
  Map<String, dynamic> parsedObj(Map<String, dynamic>? response) {
    final responseData = {
      "data": List<Movie>.from(
          response?['results'].map((object) => Movie.fromJson(object))),
      // Map the response data to Movie objects
      "page": response?['page'],
      // Current page of the response
      "total_pages": response?['total_pages']
      // Total number of pages available
    };
    return responseData;
  }

  // Function to fetch top-rated movies
  // Accepts a page number (default: 1) for pagination
  Future<Map<String, dynamic>?> getTopRated({int pageNo = 1}) async {
    final parms = {
      "lang": "en-US",
      "page": pageNo.toString()
    }; // Parameters for the API request
    try {
      final response = await (get("/movie/top_rated",
          params: parms)); // Make GET request to the top rated movies endpoint
      if (pageNo == 1) {
        CacheService().saveResToCache(MovieSectionsEnum.topRatedMovies,
            "/movie/top_rated/$pageNo", jsonEncode(response));
      }
      return parsedObj(response);
    } on SocketException catch (e) {
      UtilMethods.showToast(e);
    } catch (e) {
      UtilMethods.showToast(e);
    } finally {
      if (pageNo == 1) {
        final response =
            await CacheService().getResFromCache(CacheService.topRatedDataKey);
        return parsedObj(response);
      }
    }
    return null;
  }

  // Function to fetch detailed information about a specific movie
  // Requires the movieId and optionally accepts an appendToRes parameter
  Future<Movie?> getMovieDetails({
    required int movieId, // Movie ID is required to fetch details
    String?
        appendToRes, // Optional parameter to append additional details to the response
  }) async {
    final parms = {
      "lang": "en-US",
      "append_to_response": appendToRes
    }; // Parameters for the API request
    try {
      final response = await (get("/movie/$movieId",
          params: parms)); // Make GET request to the movie details endpoint
      if (response == null) {
        return null; // Return null if the response is empty or null
      }

      return Movie.fromJson(response);
    } on SocketException catch (e) {
      UtilMethods.showToast(e);
    } catch (e) {
      UtilMethods.showToast(e);
    }
    return null;
  }

  // Function to search for movies based on a query string
  // Accepts a page number (default: 1) for pagination and a query string
  Future<Map<String, dynamic>?> getSearchedMovie(
      {int pageNo = 1, String query = ""}) async {
    final parms = {
      "include_adult": "false", // Exclude adult content from search results
      "lang": "en-US", // Set language to English
      "page": pageNo.toString(), // Specify the page number
      "query": query // The search query string
    };
    try {
      final response = await (get("/search/movie",
          params: parms)); // Make GET request to the search movie endpoint

      return parsedObj(response);
    } on SocketException catch (e) {
      UtilMethods.showToast(e);
    } catch (e) {
      UtilMethods.showToast(e);
    }
    return null;
  }

  // Function to fetch trailers for a specific movie
  // Requires the movieId and optionally accepts an appendToRes parameter
  Future<List<Trailer>?> getTrailer({
    required int movieId, // Movie ID is required to fetch trailers
    String?
        appendToRes, // Optional parameter to append additional details to the response
  }) async {
    final parms = {"lang": "en-US"}; // Parameters for the API request
    try {
      final response = await (get("/movie/$movieId/videos",
          params: parms)); // Make GET request to the movie trailers endpoint
      if (response == null) {
        return null; // Return null if the response is empty or null
      }

      return List<Trailer>.from(response['results'].map((object) =>
          Trailer.fromJson(
              object))); // Map the response data to Trailer objects
    } on SocketException catch (e) {
      UtilMethods.showToast(e);
    } catch (e) {
      UtilMethods.showToast(e);
    }
    return null;
  }
}
