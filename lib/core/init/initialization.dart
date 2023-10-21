import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
final class AppInitialization {
  const AppInitialization._();

  static Future<void> initialization() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }
}
