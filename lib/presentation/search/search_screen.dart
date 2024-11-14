import 'package:finance_house_task/presentation/common_widgets/movie_item.dart';
import 'package:finance_house_task/store/root_store.dart';

import '../../global.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
    String query="";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  if(query.isNotEmpty)  {
      Provider.of<RootStore>(context, listen: false)
          .movieStore
          .getSearchedMovie(query: query);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    var nextPageTrigger = .99* _scrollController.position.maxScrollExtent;
    if (_scrollController.position.pixels >= nextPageTrigger) {
      Provider
          .of<RootStore>(context, listen: false)
          .movieStore
          .getSearchedMovie(query: query??"");
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreObserver(builder: (RootStore store, context) {
      return Scaffold(
        appBar: AppBar(
          title: SearchBar(
            leading: SvgPicture.asset(AssetsLinks.search),
            autoFocus: true,
            hintText: "${ExtraStrings.search} by title.",
            constraints: const BoxConstraints(minHeight: 50, maxHeight: 50.0),
            elevation: const WidgetStatePropertyAll(0),
            onChanged: (v) {
              setState(() {
                query = v;
              });
              store.movieStore.getSearchedMovie(
                  query: v.toLowerCase(), isQueryNew: true);
            },
          ),
        ),
        body: GridView.builder(
          itemCount: store.movieStore.searchedMovies.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(18),
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemBuilder: (BuildContext context, int index) {
            return MovieItem(movie: store.movieStore.searchedMovies[index]);
          },
        ),
      );
    });
  }
}
