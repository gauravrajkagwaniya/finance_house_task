
import 'package:finance_house_task/presentation/common_widgets/movie_item.dart';

import '../../global.dart';
import '../../store/movie_store.dart';
import '../../store/root_store.dart';
import '../../utils/enum.dart';

class MovieListingScreen extends StatefulWidget {
  final MovieSectionsEnum movieSectionsEnum;
  final MovieStore store;

  const MovieListingScreen(
      {super.key, required this.store, required this.movieSectionsEnum});

  @override
  State<MovieListingScreen> createState() => _MovieListingScreenState();
}

class _MovieListingScreenState extends State<MovieListingScreen> {
final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Provider.of<RootStore>(context, listen: false).movieStore.fetchMovieListOnDemand(widget.movieSectionsEnum);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

    void _onScroll() {
      var nextPageTrigger = .99 * _scrollController.position.maxScrollExtent;
    if (_scrollController.position.pixels >= nextPageTrigger) {
            Provider.of<RootStore>(context, listen: false).movieStore.fetchMovieListOnDemand(widget.movieSectionsEnum);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreObserver(
      builder: (RootStore store, context) {
        final movie = store.movieStore.getMovieListOnDemand(widget.movieSectionsEnum);
        return Scaffold(
          appBar: AppBar(title: Text(widget.movieSectionsEnum.names)),
          body: GridView.builder(
              itemCount: movie.length,
              controller: _scrollController,
              shrinkWrap: true,
              padding: const EdgeInsets.all(18),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemBuilder: (context, index) => MovieItem(movie: movie[index])),
        );
      }
    );
  }


}
