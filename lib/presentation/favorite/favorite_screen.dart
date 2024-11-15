import 'package:finance_house_task/presentation/common_widgets/custom_list.dart';
import 'package:finance_house_task/presentation/details/details_screen.dart';
import 'package:finance_house_task/store/root_store.dart';

import '../../global.dart';
import '../common_widgets/no_data_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreObserver(builder: (RootStore store, context) {
      final favMovies = store.movieStore.favMovies;
      return Scaffold(
          appBar: AppBar(),
          body: favMovies.isEmpty
              ? SizedBox(
                  height: UtilMethods.mediaSize(context).height,
                  width: UtilMethods.mediaSize(context).width,
                  child: const Center(
                      child: NoDataWidget(
                    text: 'No Favorites Available',
                    fromFavScreen: true,
                  )))
              : ListView.builder(
                  itemCount: favMovies.length,
                  itemBuilder: (context, index) => CustomInkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(movie: favMovies[index]),
                              ));
                        },
                        radius: 15,
                        child: Dismissible(
                          key: Key(favMovies[index].id.toString()),
                          direction: DismissDirection.endToStart,
                          background: slideLeftBackground(context),
                          onDismissed: (_) {
                            store.movieStore.removeFav(favMovies[index]);
                          },
                          child: CustomList(
                            movie: favMovies[index],
                          ),
                        ),
                      )));
    });
  }

  Widget slideLeftBackground(BuildContext context) {
    return Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: SizedBox(
            height: UtilMethods.mediaSize(context).height * .18,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                color: Colors.red,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      Text(
                        " Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
