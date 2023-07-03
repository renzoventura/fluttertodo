import 'package:flutter/material.dart';
import 'package:fluttertodo/components/primary_button.dart';
import 'package:fluttertodo/constants/constants.dart';
import 'package:fluttertodo/di/get_it.dart';
import 'package:fluttertodo/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferencesService sharedPrefs = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(logoImage),
                  Text(
                    "Welcome to Todo!",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "FlutterTodo is a simple to-do list app, Get organized and stay on top of your tasks with.",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onTap: () {
                sharedPrefs.setIsSplashScreenSkipped(true);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    todoFeedScreenRoute, (Route<dynamic> route) => false);
                // Navigator.of(context).pushNamed(todoFeedScreenRoute);
              },
              text: 'CONTINUE',
            ),
          ],
        ),
      ),
    );
  }
}
