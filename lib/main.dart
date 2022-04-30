import 'package:farm_app/src/core/getIt/setup.dart';
import 'package:farm_app/src/core/navigator/routers.dart';
import 'package:farm_app/src/core/theme/theme_main.dart';

import 'package:farm_app/src/features/splash/presenter/page/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm App',
      theme: themeCustom(),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      routes: routers,
    );
  }
}
