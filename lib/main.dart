import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:sleep_sounds/app/modules/utills/colors.dart';

import 'app/modules/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // appBarTheme: AppBarTheme(color: AppColors.backgroundColor
        // ),
        // scaffoldBackgroundColor: AppColors.backgroundColor
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
