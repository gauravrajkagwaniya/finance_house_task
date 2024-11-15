import 'package:finance_house_task/presentation/common_widgets/custom_video_player.dart';
import 'package:finance_house_task/presentation/common_widgets/no_data_widget.dart';
import 'package:finance_house_task/presentation/details/video_grid_widget.dart';

import '../../global.dart';

import '../../store/root_store.dart';

class TrailersSection extends StatefulWidget {
  const TrailersSection({
    super.key,
  });

  @override
  State<TrailersSection> createState() => _TrailersSectionState();
}

class _TrailersSectionState extends State<TrailersSection> {
  @override
  Widget build(BuildContext context) {
    return StoreObserver(builder: (RootStore store, context) {
      return store.movieStore.isTrailerLoading
          ? const CircularProgressIndicator()
          : Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Trailers",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  store.movieStore.trailers != null
                      ? SizedBox(
                          height: UtilMethods.mediaSize(context).height * .40,
                          width: UtilMethods.mediaSize(context).width * .90,
                          child: GridView.builder(
                            itemCount: store.movieStore.trailers?.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: (BuildContext context, int index) {
                              return CustomInkWell(
                                  radius: 15,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CustomVideoPlayer(
                                            trailer: store
                                                .movieStore.trailers![index],
                                          ),
                                        ));
                                  },
                                  child: VideoGridWidget(
                                      trailer:
                                          store.movieStore.trailers![index]));
                            },
                          ),
                        )
                      : SizedBox(
                          width: UtilMethods.mediaSize(context).width * .90,
                          child: const NoDataWidget(
                              text: "Trailers are not available")),
                ],
              )
            ]);
    });
  }
}
