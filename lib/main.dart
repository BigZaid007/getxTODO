import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newnote/theme/splashScreen.dart';
import 'package:newnote/theme/theme_services.dart';
import 'package:newnote/theme/themes.dart';
import 'package:newnote/view/home_page.dart';

main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle
      (SystemUiOverlayStyle(
        statusBarColor: Colors.white,));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Note App by flutter",
      home: SplashScreen(),
      themeMode: themeService().theme,
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}
