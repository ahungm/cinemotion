import 'package:cinemotion/presentation/widgets/videos/youtube_video_player.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/entities/video/video.dart';

class VideoList extends StatelessWidget {
  final List<Video> videos;

  const VideoList({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() =>
      (videos.isEmpty) ? SizedBox() : _showVideoList(videos: videos);
}

// Inner Methods
Widget _showVideoList({required List<Video> videos}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: const Text(
          textAlign: TextAlign.start,
          'Miniatura',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      const SizedBox(height: 20),
      // Show just the first video related to the movie
      YoutubeVideoPlayer(
        youtubeId: videos.first.youtubeKey,
        name: videos.first.name,
      ),
    ],
  );
}

List<Widget> showAllVideos(List<Video> videos) {
  return videos
      .map(
        (video) =>
            YoutubeVideoPlayer(youtubeId: video.youtubeKey, name: video.name),
      )
      .toList();
}
