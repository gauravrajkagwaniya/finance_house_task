class ExtraStrings {
  static const String fontName = 'lato';
  static const String home = 'Home';
  static const String search = 'Search';
  static const String favorite = 'Favorite';
  static const String setting = 'Settings';

  static const String darkMode = "Dark Mode";


// Endpoint
  static const String popularMoviesEndpoint = "/movie/popular";
  static const String topRatedMoviesEndpoint = "/movie/top_rated";
  static const String nowPlayingMoviesEndpoint = "/movie/now_playing";
  static const String detailsMoviesEndpoint = "/movie/{movie_id}";

// pagonation
  static const String pagination = "?language=en-US&page=";

  // movie display Url

  static const String movieVideosEndpoint = "/movie/{movie_id}/videos";

// images handle URL
  static const String imageHandleUrl = "https://images.tmdb.org/t/p/w500/";

// to open a video

  static const String youtubeVideoPlayUrl =
      "https://www.youtube.com/watch?v=";

  // saving token here just beacuse we are not doing authentication but to consume api we require token for all the task
  static const String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzc0NGNiMDk2NWU2YjE5ODJhZmJjZDMyNTI0M2FkYiIsIm5iZiI6MTczMTM5NzQ1OS40MDYxNiwic3ViIjoiNjczMzA2MjUxM2JlYWY0NjViNzNiYzk2Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.MxbynMBaZFvoQNy1--qQGQCk5kRdbLya4sgxjOtUHdM";
}
