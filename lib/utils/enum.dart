enum MovieSectionsEnum { popularMovies, nowPlaying, topRatedMovies, favoriteMovie }

extension MovieSectionsExtension on MovieSectionsEnum {
  String get names {
    switch (this) {
      case MovieSectionsEnum.popularMovies:
        return "Popular Movies";
      case MovieSectionsEnum.nowPlaying:
        return "Now Playing";
      case MovieSectionsEnum.topRatedMovies:
        return "Top Rated Movies";
      case MovieSectionsEnum.favoriteMovie:
        return "Favorite Movie";
    }
  }
}
