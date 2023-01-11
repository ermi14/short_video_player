import 'package:flutter/material.dart';
import 'package:pushit_test/presentation/pages/entrance_page.dart';

import '../presentation/pages/video_player_page.dart';

class AppRouter {
  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case EntrancePage.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const EntrancePage(),
        );
      case VideoPlayerPage.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const VideoPlayerPage(),
        );
      default:
        return null;
    }
  }
}
