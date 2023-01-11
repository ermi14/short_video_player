import 'package:flutter/material.dart';
import 'package:pushit_test/data/model/video_model.dart';
import 'package:pushit_test/data/repository/videos_repository.dart';

import '../../data/model/response_status.dart';

class VideosProvider extends ChangeNotifier {
  VideosProvider({required this.videosRepository});

  final VideosRepository videosRepository;

  ResponseStatus responseStatus = ResponseStatus.idle;

  final List<VideoModel> _videos = [];

  List<VideoModel> get videos => _videos;

  Future<void> getAllTodos() async {
    responseStatus = ResponseStatus.loading;
    notifyListeners();

    try {
      final response = await videosRepository.getVideos();
      _videos.clear();
      _videos.addAll(response.clips);

      responseStatus = ResponseStatus.success;
      notifyListeners();
    } catch (e) {
      responseStatus = ResponseStatus.error;
      notifyListeners();
    }
  }
}
