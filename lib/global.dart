library my_project.global;

import 'package:shared_preferences/shared_preferences.dart';

//the setting of the app
bool isDarkModeEnabled = false;
getIsdark() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isDarkModeEnabled = prefs.getBool("isDark") ?? false;
  return isDarkModeEnabled;
}

bool isScrollDown = false;
bool isGridModeEnabled = false;
bool isOrderByAlphabetical = false;
