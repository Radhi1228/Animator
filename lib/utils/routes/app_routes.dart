import 'package:animation_app/screen/bookmark/view/bookmark_screen.dart';
import 'package:animation_app/screen/detail/view/detail_screen.dart';
import 'package:animation_app/screen/home/view/home_screen.dart';
import 'package:animation_app/screen/splash/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder> app_routes =
{
  '/' : (c1) => const SplashScreen(),
  'home' : (c1) => const HomeScreen(),
  'detail' : (c1) => const DetailScreen(),
  'bookmark' : (c1) => const BookmarkScreen(),
};