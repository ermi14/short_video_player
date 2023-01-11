import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pushit_test/presentation/pages/entrance_page.dart';
import 'package:pushit_test/presentation/providers/videos_provider.dart';
import 'package:pushit_test/utils/routes.dart';
import 'package:pushit_test/utils/themes.dart';

import 'di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocatorInit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideosProvider(videosRepository: sl()),
      child: MaterialApp(
        title: 'Video Player App',
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        onGenerateRoute: appRouter.onGeneratedRoute,
        initialRoute: EntrancePage.routeName,
      ),
    );
  }
}
