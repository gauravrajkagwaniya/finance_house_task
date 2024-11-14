import '../../global.dart';
import '../../model/movie/movie.dart';

class MovieBigCard extends StatelessWidget {
  final Movie movie;

  const MovieBigCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Background image
        ImageCacheCustom(
          url: UtilMethods.imgUrl(movie.posterPath ?? ""),
              width: double.infinity,
              height: double.infinity,
            ),
            // Image color shadow overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: RadialGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                  center: Alignment.center,
                  radius: 1.2,
                ),
              ),
            ),
            // Gradient overlay for top and bottom
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Colors.black.withOpacity(0.6),
            //         Colors.transparent,
            //         Colors.black.withOpacity(0.6),
            //       ],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //     ),
            //   ),
            // ),
            // // Title, Subtitle, and Buttons
            // Positioned(
            //   bottom: 20,
            //   left: 20,
            //   right: 20,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Devara',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 24,
            //           fontWeight: FontWeight.bold,
            //           shadows: [
            //             Shadow(
            //               color: Colors.black.withOpacity(0.8),
            //               blurRadius: 6,
            //               offset: Offset(0, 2),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(height: 4),
            //       Text(
            //         'Revenge • Indian • Action & Adventure',
            //         style: TextStyle(
            //           color: Colors.white.withOpacity(0.8),
            //           fontSize: 14,
            //           shadows: [
            //             Shadow(
            //               color: Colors.black.withOpacity(0.8),
            //               blurRadius: 6,
            //               offset: Offset(0, 2),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(height: 16),
            //       Row(
            //         children: [
            //           ElevatedButton.icon(
            //             onPressed: () {
            //               // Play button action
            //             },
            //             style: ElevatedButton.styleFrom(
            //                 // primary: Colors.white,
            //                 // onPrimary: Colors.black,
            //                 ),
            //             icon: Icon(Icons.play_arrow),
            //             label: Text('Play'),
            //           ),
            //           SizedBox(width: 10),
            //           OutlinedButton.icon(
            //             onPressed: () {
            //               // Add to list action
            //             },
            //             style: OutlinedButton.styleFrom(
            //               // primary: Colors.white,
            //               side: BorderSide(color: Colors.white),
            //             ),
            //             icon: Icon(Icons.add),
            //             label: Text('My List'),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
