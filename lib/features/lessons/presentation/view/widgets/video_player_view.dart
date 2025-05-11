import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String? videoPath;
  final String? title;

  const VideoPlayerScreen({super.key, this.videoPath, this.title});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath!)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
        _isPlaying = true;
      });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      _isPlaying = false;
    } else {
      _controller.play();
      _isPlaying = true;
    }
    setState(() {});
  }

  String _formatDuration(Duration duration) {
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.title ?? "Video",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:
          _isInitialized
              ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            VideoPlayer(_controller),
                            _ControlsOverlay(
                              controller: _controller,
                              onToggle: _togglePlayPause,
                              isPlaying: _isPlaying,
                            ),
                            VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              padding: const EdgeInsets.only(bottom: 6),
                              colors: VideoProgressColors(
                                playedColor: Colors.blueAccent,
                                bufferedColor: Colors.white30,
                                backgroundColor: Colors.white10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${_formatDuration(_controller.value.position)} / ${_formatDuration(_controller.value.duration)}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Powered by Flutter Video Player",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isPlaying;
  final VoidCallback onToggle;

  const _ControlsOverlay({
    required this.controller,
    required this.onToggle,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: controller.value.isPlaying ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: IconButton(
          iconSize: 64,
          icon: Icon(
            isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
            color: Colors.white70,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}
