import 'package:cd_app/pages/core/main_component.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.mainTheme,
      home: MainComponent(),
      initialRoute: AppRoutes.main,
        getPages: AppPages.pages,
    );
  }
}
