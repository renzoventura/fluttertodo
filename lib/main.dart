import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodo/constants/constants.dart';
import 'package:fluttertodo/di/get_it.dart';
import 'package:fluttertodo/screens/splash_screen/splash_screen.dart';
import 'package:fluttertodo/screens/todo/screens/todo_feed_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final sharedPrefs = getIt<SharedPreferencesService>();
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        initialRoute: sharedPrefs.isSplashScreenSkipped()
            ? todoFeedScreenRoute
            : splashScreenRoute,
        routes: routes,
      ),
    );
  }
}

Map<String, WidgetBuilder> routes = {
  splashScreenRoute: (context) => const SplashScreen(),
  todoFeedScreenRoute: (context) => const TodoFeedScreen(),
};

String splashScreenRoute = '/';
String todoFeedScreenRoute = '/todo';
