import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatefulWidget {
  @override
  _ReelsPageState createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  final PageController _pageController = PageController();
  List<VideoPlayerController> _videoControllers = [];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Initialize video controllers
    for (String url in videoUrls) {
      final controller = VideoPlayerController.network(url);
      controller.initialize().then((_) {
        setState(() {}); // Update UI when ready
      });
      _videoControllers.add(controller);
    }

    // Auto-play first video
    _videoControllers.first.play();

    // Listen for page changes
    _pageController.addListener(() {
      int nextPage = _pageController.page?.round() ?? 0;
      if (nextPage != _currentPage) {
        _videoControllers[_currentPage].pause();
        _currentPage = nextPage;
        _videoControllers[_currentPage].play();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          final controller = _videoControllers[index];
          return controller.value.isInitialized
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: controller.value.size.width,
                        height: controller.value.size.height,
                        child: VideoPlayer(controller),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      child: Text(
                        'Video ${index + 1}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
