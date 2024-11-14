import '../global.dart';


class CommonWidgets {
  static Widget back(
      {required BuildContext context, bool onHomePage = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomInkWell(
          radius: 0,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SvgPicture.asset(AssetsLinks.backIc,semanticsLabel: "back",fit: BoxFit.scaleDown ,)),
    );
  }
}