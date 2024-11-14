import 'package:carousel_slider/carousel_slider.dart';

import '../../global.dart';
import '../../store/root_store.dart';
import 'movie_big_card.dart';

class CustomCarousel extends StatelessWidget {
  final RootStore store;
  final double customHeight;
  final Widget? child;
  const CustomCarousel({
    super.key, required this.store, required this.customHeight, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height:customHeight,
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: store.movieStore.getFirstTwoFromEach().map((i) {
        return Builder(
          builder: (BuildContext context) {
            return MovieBigCard(
              movie: i,
            );
          },
        );
      }).toList(),
    );
  }
}