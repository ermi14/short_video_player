import 'package:flutter/material.dart';
import 'package:pushit_test/presentation/pages/video_player_page.dart';

import '../../utils/constants.dart';

class EntrancePage extends StatelessWidget {
  static const routeName = "/entrance_page";

  const EntrancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PushIt Test'),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: kBaseColor,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ermiyas Kasahun",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
              ),

              const SizedBox(height: 20),

              /// This button is used to navigate to the [VideoPlayerPage]
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    VideoPlayerPage.routeName,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                  child: Text(
                    "Go to Videos",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: kBaseColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
