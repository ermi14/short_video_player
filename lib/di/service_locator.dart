import 'package:get_it/get_it.dart';
import 'package:pushit_test/data/repository/videos_repository.dart';

import '../data/data_source/remote_data_source.dart';
import '../presentation/providers/videos_provider.dart';
import '../utils/api_helper.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  /// Provider
  sl.registerFactory<VideosProvider>(
      () => VideosProvider(videosRepository: sl()));

  /// Repository
  sl.registerFactory<VideosRepository>(
      () => VideosRepository(remoteDataSource: sl()));

  /// Data Source
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSource(apiBaseHelper: sl()));

  /// Dio instance
  ApiBaseHelper apiHelper = ApiBaseHelper();
  sl.registerLazySingleton<ApiBaseHelper>(() => apiHelper);
}
