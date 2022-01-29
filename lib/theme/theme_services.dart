import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class themeService
{

  final box=GetStorage();
  final key="isDarkMode";

  saveTheme(bool isDark)=> box.write(key, isDark);

  bool loadTheme()=>box.read(key)??false;
  ThemeMode get theme => loadTheme()?ThemeMode.light:ThemeMode.dark;

  void swtichTheme()
  {
    Get.changeThemeMode(loadTheme()?ThemeMode.dark:ThemeMode.light);
    saveTheme(!loadTheme());
  }

}