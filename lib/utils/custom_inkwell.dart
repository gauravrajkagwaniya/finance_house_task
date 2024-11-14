import '../global.dart';

class CustomInkWell extends StatelessWidget {
  final double radius;
  final Widget child;
  final VoidCallback onTap;

  const CustomInkWell(
      {Key? key,
        required this.child,
        required this.radius,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: child),
    );
  }
}