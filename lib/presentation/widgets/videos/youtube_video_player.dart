import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  // Attributes
  final String youtubeId;
  final String name;

  // Constructor
  const YoutubeVideoPlayer({
    super.key,
    required this.youtubeId,
    required this.name,
  });

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  // Define the controller to the video player
  late YoutubePlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = _setControllerConfiguration();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [YoutubePlayer(controller: _videoPlayerController)],
      ),
    );
  }

  // Inner Methods
  YoutubePlayerController _setControllerConfiguration() =>
      YoutubePlayerController(
        initialVideoId: widget.youtubeId,
        flags: _youtubePlayerFlags,
      );

  // Variable
  final YoutubePlayerFlags _youtubePlayerFlags =
      // Video Properties
      const YoutubePlayerFlags(
        hideControls: true,
        showLiveFullscreenButton: false,
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      );
}
