import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pushit_test/data/model/response_status.dart';
import 'package:pushit_test/presentation/providers/videos_provider.dart';
import 'package:pushit_test/presentation/widgets/video_player.dart';
import 'package:pushit_test/utils/constants.dart';

class VideoPlayerPage extends StatefulWidget {
  static const routeName = "/video_player_page";

  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VideosProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PushIt Test'),
      ),
      body: Consumer<VideosProvider>(
        builder: (context, value, child) {
          /// If status is loading then it will show
          /// the circular progress indicator
          if (value.responseStatus == ResponseStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          } else if (value.responseStatus == ResponseStatus.success) {
            /// Pass the [VideoModel] for every page by using their index
            return Scrollbar(
              controller: _pageController,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: value.videos.length,
                itemBuilder: (context, index) {
                  return VideoPlayerWidget(
                    videoModel: value.videos[index],
                  );
                },
              ),
            );
          } else if (value.responseStatus == ResponseStatus.error) {
            /// If status is error then it will show
            /// the try again button
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Failed to fetch data.",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor,
                        ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<VideosProvider>(context, listen: false)
                          .getAllTodos();
                    },
                    child: Text(
                      "Try Again",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kBaseColor,
                          ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
