import 'package:finance_house_task/presentation/details/details_screen.dart';
import 'package:finance_house_task/presentation/favorite/favorite_screen.dart';
import 'package:finance_house_task/presentation/search/search_screen.dart';
import 'package:finance_house_task/presentation/settings/settings_screen.dart';
import 'package:finance_house_task/store/root_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../global.dart';
import 'movie_list/movie_listing_screen.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      const MovieListingScreen(),
      const SearchScreen(),
      const FavoriteScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      body: StoreObserver(
        builder: (RootStore store, context) {
          Future.delayed(Duration.zero, () {
            if (store.connectivityStore.connectivityResult[0] == ConnectivityResult.none
            ) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('No Internet Connection'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ));
            }
          });
          return widgetOptions.elementAt(selectedIndex);
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Styles.isBright(context)
            ? Styles.whiteColors
            : Styles.netflixColors,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Styles.blackColors,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AssetsLinks.homeFill,
              height: 25,
              color: Styles.blackColors,
            ),
            icon: SvgPicture.asset(AssetsLinks.home, height: 25),
            tooltip: ExtraStrings.home,
            label: ExtraStrings.home,
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AssetsLinks.searchFill, height: 25),
            icon: SvgPicture.asset(AssetsLinks.search, height: 25),
            tooltip: ExtraStrings.search,
            label: ExtraStrings.search,
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AssetsLinks.favoriteFill, height: 25),
            icon: SvgPicture.asset(AssetsLinks.favorite, height: 25),
            tooltip: ExtraStrings.favorite,
            label: ExtraStrings.favorite,
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AssetsLinks.settingsFill, height: 25),
            icon: SvgPicture.asset(AssetsLinks.settings, height: 25),
            tooltip: ExtraStrings.setting,
            label: ExtraStrings.setting,
          ),
        ],
        currentIndex: selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: (value) => setState(() {
          selectedIndex = value;
        }),
      ),
    );
  }
}
