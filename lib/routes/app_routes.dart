import 'package:flutter/material.dart';
import 'package:shopping/presetation/about/app_about.dart';
import 'package:shopping/presetation/home/app_home.dart';
import 'package:shopping/presetation/splash/app_splash.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/': (context) => const AppSplash(),
    '/home': (context) => const AppHome(),
    '/about': (context) => const AppAbout()
  };
}
