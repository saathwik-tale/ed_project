import 'package:ed_project/db/db_helper.dart';
import 'package:ed_project/home_page.dart';
import 'package:ed_project/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ed_project/navigation_bar.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ED Project',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
      home: Navigation(),
    );
  }
}
