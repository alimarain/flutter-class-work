import 'package:flutter/material.dart';


class ReelsView extends StatelessWidget {
  ReelsView({super.key, required String videoUrl});

  final List<String> videoUrl = [
    'https://videos.pexels.com/video-files/3066447/3066447-uhd_2732_1440_24fps.mp4',
    'https://videos.pexels.com/video-files/1860079/1860079-uhd_2560_1440_25fps.mp4',
    'https://videos.pexels.com/video-files/3066446/3066446-uhd_2732_1440_24fps.mp4',
    'https://videos.pexels.com/video-files/853828/853828-hd_1920_1080_25fps.mp4',
    'https://videos.pexels.com/video-files/854514/854514-hd_1280_720_30fps.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoUrl.length,
        itemBuilder: (context, index) {
          return ReelsView(videoUrl: videoUrl[index]);
        },
      ),
    );
  }
}