import 'dart:ui';

import 'package:finance_house_task/global.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

abstract class UtilMethods {
  /// Creates a delayed Future that completes after 200 milliseconds.
  static Future delayed() {
    return Future.delayed(const Duration(milliseconds: 200));
  }

  /// Hides the keyboard if it is currently focused in the given context.
  static void hideKeyBoard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.unfocus();
    }
  }

  /// Checks if the application is running on the web.
  static bool isKWeb() {
    if (kIsWeb) {
      return true;
    }
    return false;
  }

  /// Prints a debug message to the console if in debug mode.
  static void kPrintMessage(String message, {id = "my_first_log"}) {
    if (kDebugMode) {
      debugPrint("==debugMessage ==> $id =>$message");
    }
  }

  /// Returns a widget based on the current build mode (debug or release).
  static Widget? kIsDebugMode(
      {required Widget debugChild, required Widget releaseChild}) {
    if (kDebugMode) {
      return debugChild;
    } else {
      return releaseChild;
    }
  }

  /// Gets the media size of the current context.
  static Size mediaSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Retrieves the text theme from the current context's theme.
  static TextTheme textTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  ///helper widget custom image
  // static Widget imageCustom({required String url}){
  //   return CachedNetworkImage(
  //     imageUrl:url, fit: BoxFit.cover,
  //     errorWidget: (context, url, error) => const Icon(Icons.error),
  //   );
  // }

  ///helper for image uri
  static String imgUrl(String absUrl) {
    return "${ExtraStrings.imageHandleUrl}$absUrl";
  }

  /// Helper function to determine shimmer base color based on theme
  static Color getShimmerBaseColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.grey[600]!;
    } else {
      return Colors.grey[400]!;
    }
  }

  /// Helper function to determine shimmer highlight color based on theme
  static Color getShimmerHighlightColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.grey[800]!;
    } else {
      return Colors.grey[100]!;
    }
  }

  /// Helper fun for simmer
  static Widget getSimmerWidget({
    required BuildContext context,
    required double height,
    required double width,
  }) {
    return Shimmer.fromColors(
        baseColor: UtilMethods.getShimmerBaseColor(context),
        highlightColor: UtilMethods.getShimmerHighlightColor(context),
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
            )));
  }

  /// helper fun main shimmer
  static Widget getSimmerTvWidget({required BuildContext context}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UtilMethods.getSimmerWidget(
              context: context,
              height: UtilMethods.mediaSize(context).height / 7,
              width: UtilMethods.mediaSize(context).width / 1.5),
          const SizedBox(
            height: 10,
          ),
          UtilMethods.getSimmerWidget(
              context: context,
              height: UtilMethods.mediaSize(context).height * .05,
              width: UtilMethods.mediaSize(context).width / 1.2),
        ],
      ),
    );
  }

  /// bottom sheet for where ever it needed
  static void showBottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet<dynamic>(
      context: context,
      isDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 2, sigmaY: 2, tileMode: TileMode.clamp),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Styles.isBright(context)
                    ? Styles.whiteColors
                    : Styles.blackColors,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: widget,
          ),
        );
      },
    );
  }

  /// Show SnackBar based on network status
  static void showToast(Object e) {
    UtilMethods.kPrintMessage("${e.runtimeType}");
    final message = e.runtimeType.toString().contains("ClientSocketException")
        ? "Internet not available"
        : "Something went wrong";
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Styles.blackColors,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  /// Show SnackBar based on center
  static void showPositionedToast(String message,
      {ToastGravity? gravity = ToastGravity.CENTER}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: Styles.blackColors,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
