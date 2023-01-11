import 'package:pushit_test/data/data_source/remote_data_source.dart';

import '../../utils/exceptions.dart';
import '../model/videos_response_model.dart';

class VideosRepository {
  final RemoteDataSource remoteDataSource;

  VideosRepository({required this.remoteDataSource});

  Future<VideosResponseModel> getVideos() async {
    try {
      final response = await remoteDataSource.getVideos();
      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return VideosResponseModel.fromJson(response.data);
        } else {
          throw NetworkException("Unknown Error");
        }
      } else {
        throw NetworkException("Unknown Error");
      }
    } on NetworkException catch (e) {
      throw NetworkException(e.errorMessage);
    }
  }
}
