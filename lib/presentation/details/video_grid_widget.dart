import '../../global.dart';
import '../../model/movie/trailer.dart';

class VideoGridWidget extends StatelessWidget {
  final Trailer trailer;

  const VideoGridWidget({
    Key? key,
    required this.trailer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Text with Ellipsis Overflow
          Text(
            trailer.type??"",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 4),
          Text(
            trailer.name??"",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const Spacer(),
          // Play Icon Button
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.blue,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }
}