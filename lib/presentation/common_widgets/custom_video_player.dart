import 'package:finance_house_task/global.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../model/movie/trailer.dart';

class CustomVideoPlayer extends StatefulWidget {
  final Trailer trailer;

  const CustomVideoPlayer({super.key, required this.trailer});

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the YouTube player controller
    _controller = YoutubePlayerController(
      initialVideoId: widget.trailer.key!,
      // Assuming 'key' is the YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.trailer.type!),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
          return Center(
            child: Column(
              children: [
                player,
                // a slik white shadow
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 60.0,
                      ),
                    ],
                  ),
                ),
              ],
            ), // Display the YouTube player
          );
        },
      ),
    );
  }
}
