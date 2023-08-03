import "package:flutter/material.dart";
import "package:youtube_player_flutter/youtube_player_flutter.dart";

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key : key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final videoURL = "https://www.youtube.com/watch?v=jfKfPfyJRdk";
  late YoutubePlayerController _controller;

  @override

  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        isLive: true,
        controlsVisibleAtStart: false,
        showLiveFullscreenButton: false,
      )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera Feed"), backgroundColor: Colors.transparent,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: false,
            ),
        ],
      )
      );
      
  }
}