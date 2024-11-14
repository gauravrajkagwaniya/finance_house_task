import 'dart:ui';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:finance_house_task/global.dart';
import 'package:finance_house_task/presentation/common_widgets/no_data_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

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
  static void kPrintMessage(String message) {
    if (kDebugMode) {
      print("==debugMessage==> $message");
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
  static void showNetworkStatusSnackBar(
      BuildContext context, ConnectivityResult result) {
    final snackBarContent = result == ConnectivityResult.none
        ? 'No Internet Connection'
        : 'Connected to the Internet';

    SnackBar(
      content: Text(snackBarContent),
      duration: const Duration(seconds: 2),
      backgroundColor:
          result == ConnectivityResult.none ? Colors.red : Colors.green,
    );
  }
}

class ImageCacheCustom extends StatelessWidget {
  final String url;
  final double height;
  final double width;


  const ImageCacheCustom({super.key, required this.url,  this.height=150,  this.width=150});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FastCachedImage(
        url: url,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(seconds: 1),
        errorBuilder: (context, exception, stacktrace) {
          return const NoDataWidget(text: "Unavailable");
        },
        loadingBuilder: (context, progress) {
          debugPrint(
              'Progress: ${progress.isDownloading} ${progress.downloadedBytes} / ${progress.totalBytes}');
          return UtilMethods.getSimmerWidget(
            context: context,
            height: height,
            width: width,
          );
        },
      ),
    );
  }
}
