import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newlogin/app/settings/settings.dart';
import 'package:newlogin/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Settings appSettings = Settings.instance;
  await appSettings.loadData();
  runApp(weather_screen());
}
class weather_screen extends StatelessWidget {
  Settings appSettings = Settings.instance;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather",
      initialRoute: appSettings.currentLocation >= 0 ? AppPages.INITIAL : AppPages.LOCATION,
      getPages: AppPages.routes,
    );
  }
}
