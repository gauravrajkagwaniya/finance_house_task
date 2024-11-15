import '../../global.dart';

class NoDataWidget extends StatelessWidget {
  final String text;
  final bool fromFavScreen;

  const NoDataWidget(
      {super.key, required this.text, this.fromFavScreen = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(fromFavScreen ? Icons.heart_broken : Icons.info_outline,
            color: Styles.netflixColors, size: 40),
        const SizedBox(height: 16),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
