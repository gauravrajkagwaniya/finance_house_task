
import 'package:carousel_slider/carousel_slider.dart';

import '../../global.dart';
import '../../model/movie/movie.dart';

class ProductionCompanies extends StatelessWidget {
  const ProductionCompanies({
    super.key,
    required this.movieDetail,
  });

  final Movie? movieDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            const Text(
              "Production Companies",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
                height: 100,
                width: UtilMethods.mediaSize(context).width * .90,
                child: CarouselSlider(
                  options: CarouselOptions(autoPlay: true),
                  items: movieDetail
                      ?.productionCompanies!
                      .map((item) => SizedBox(
                      child: item.logoPath !=
                          null
                          ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                        child: Image.network(UtilMethods
                            .imgUrl(item.logoPath!)),)
                          : SizedBox(
                          width: 100,
                          child: Center(
                            child: Text(
                              item.name!,
                              style: const TextStyle(
                                  fontWeight:
                                  FontWeight
                                      .bold),
                              textAlign:
                              TextAlign
                                  .center,
                            ),
                          ))))
                      .toList(),
                )),
          ],
        ),
      ],
    );
  }
}