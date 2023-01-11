import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pushit_test/data/model/video_model.dart';
import 'package:pushit_test/utils/constants.dart';
import 'package:video_player/video_player.dart';

import 'full_screen_image.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    required this.videoModel,
    Key? key,
  }) : super(key: key);

  final VideoModel videoModel;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  initPlayer() async {
    /// Instantiate the video player before this widget is drawn on the canvas.
    _controller = VideoPlayerController.network(widget.videoModel.clipUrl);
    await _controller.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _chewieController != null
          ? Stack(
              children: [
                FullScreenImage(
                  imageUrl: widget.videoModel.clipThumb,
                  isBlurred: true,
                ),
                _videoInfo(),
                Align(
                  alignment: Alignment.center,
                  child: Chewie(
                    controller: _chewieController!,
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                FullScreenImage(
                  imageUrl: widget.videoModel.clipThumb,
                  isBlurred: false,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
    );
  }

  /// Information about the video will be displayed
  /// by this widget
  Widget _videoInfo() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title:  ${widget.videoModel.clipTitle}",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: kBaseColor,
                  ),
            ),
            Text(
              "Date:  ${widget.videoModel.clipDate?.toLocal().toString()}",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: kBaseColor,
                  ),
            ),
            Text(
              "Site:  ${widget.videoModel.siteName}",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: kBaseColor,
                  ),
            ),
            Text(
              "Group:  ${widget.videoModel.marGroup}",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: kBaseColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  /// Dispose the [VideoPlayerController] on removing widget from canvas to
  /// release resource leak and release resource avoid memory.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController?.dispose();
  }
}
