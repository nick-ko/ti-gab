import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AdVideoCarousel extends StatefulWidget {
  final List<String> videoUrls;
  final Duration singleAdDuration;
  final VoidCallback? onCycleCompleted;
  final double width;
  final double height;
  final bool autoPlay;
  final bool loopCycle;

  const AdVideoCarousel({
    Key? key,
    required this.videoUrls,
    this.singleAdDuration = const Duration(seconds: 30),
    this.onCycleCompleted,
    this.width = double.infinity,
    this.height = 200,
    this.autoPlay = true,
    this.loopCycle = true,
  }) : super(key: key);

  @override
  State<AdVideoCarousel> createState() => _AdVideoCarouselState();
}

class _AdVideoCarouselState extends State<AdVideoCarousel> {
  VideoPlayerController? _controller; // Changé de "late" à nullable
  int _currentVideoIndex = 0;
  bool _isLoading = true;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    if (widget.videoUrls.isNotEmpty) {
      _initVideoPlayer(widget.videoUrls[_currentVideoIndex]);
    }
  }

  void _initVideoPlayer(String videoUrl) async {
    setState(() {
      _isLoading = true;
    });

    // Dispose of the previous controller if it exists
    if (_controller != null) {
      await _controller!.dispose();
    }

    _controller = VideoPlayerController.network(videoUrl);

    try {
      await _controller!.initialize();
      await _controller!.setLooping(false);

      _controller!.addListener(_videoListener);

      setState(() {
        _isLoading = false;
      });

      // Auto-play if configured
      if (widget.autoPlay) {
        _playVideo();
      }
    } catch (e) {
      print('Erreur lors de l\'initialisation du lecteur vidéo: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _videoListener() {
    // Vérifier si le contrôleur est initialisé
    if (_controller == null) return;

    // Check if video has ended
    if (_controller!.value.position >= _controller!.value.duration) {
      _playNextVideo();
    }
  }

  void _playNextVideo() {
    int nextIndex = _currentVideoIndex + 1;

    // Check if we've completed the full cycle
    if (nextIndex >= widget.videoUrls.length) {
      if (widget.onCycleCompleted != null) {
        widget.onCycleCompleted!();
      }

      // If looping is enabled, start again from the beginning
      if (widget.loopCycle) {
        nextIndex = 0;
      } else {
        // Stop here if not looping
        return;
      }
    }

    setState(() {
      _currentVideoIndex = nextIndex;
    });

    _initVideoPlayer(widget.videoUrls[_currentVideoIndex]);
  }

  void _playVideo() {
    if (_controller != null) {
      _controller!.play();
      setState(() {
        _isPlaying = true;
      });

      // Optional: Force ad to end after specified duration
      Future.delayed(widget.singleAdDuration, () {
        if (mounted && _isPlaying) {
          _playNextVideo();
        }
      });
    }
  }

  void _pauseVideo() {
    if (_controller != null && _controller!.value.isPlaying) {
      _controller!.pause();
      setState(() {
        _isPlaying = false;
      });
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.removeListener(_videoListener);
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videoUrls.isEmpty) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: Colors.white,
        child: const Center(
          child: Text(
            'Aucune vidéo publicitaire disponible',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: _isLoading || _controller == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
                  if (!_isPlaying)
                    IconButton(
                      icon: const Icon(Icons.play_arrow,
                          size: 50, color: Colors.white),
                      onPressed: _playVideo,
                    ),
                  if (_isPlaying)
                    GestureDetector(
                      onTap: _pauseVideo,
                      child: Container(
                        color: Colors.transparent,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Publicité ${_currentVideoIndex + 1}/${widget.videoUrls.length}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.videoUrls.length,
                        (index) => Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentVideoIndex == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
