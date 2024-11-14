import '../../global.dart';
import '../../model/movie/movie.dart';
import '../../utils/enum.dart';
import '../view_all/view_all_screen.dart';
import 'movie_item.dart';

class MediaTypeSection extends StatelessWidget {
  final MovieSectionsEnum movieSectionsEnum;
  final dynamic store;
  final List<Movie?> movies;

  const MediaTypeSection({
    super.key,
    required this.movieSectionsEnum,
    this.store,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movieSectionsEnum.names,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewAllScreen(
                          movieSectionsEnum: movieSectionsEnum,
                          store: store.movieStore,
                        ),
                      ));
                },
                child: const Text("View All"),
              ),
            ],
          ),
          SizedBox(
            height: UtilMethods.mediaSize(context).height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.isNotEmpty?10:0,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MovieItem(movie: movie!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}