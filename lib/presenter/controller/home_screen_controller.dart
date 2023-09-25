import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:primerapp/presenter/bindings/app_bindings.dart';
import 'package:primerapp/presenter/views/profile_page.dart';
import 'package:primerapp/presenter/views/login_page.dart';
import 'package:primerapp/presenter/views/setting_page.dart';
import 'package:primerapp/presenter/views/help_page.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  var currentIndex = 0.obs;

  final pages = <String>[
    '/Login',
    '/Profile',
    '/Settings',
    '/Help',
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {

    if (settings.name == '/Login') {
      return GetPageRoute(
        settings: settings,
        page: () => LoginPage(),
        binding: LoginBinding(),
      );
    }
    if (settings.name == '/Profile') {
      return GetPageRoute(
        settings: settings,
        page: () => ProfilePage(),
        binding: ProfileBinding(),
      );
    }
    if (settings.name == '/Settings') {
      return GetPageRoute(
        settings: settings,
        page: () => SettingPage(),
        binding: SettingBinding(),
      );
    }
    if (settings.name == '/Help') {
      return GetPageRoute(
        settings: settings,
        page: () => HelpPage(),
        binding: HelpBinding(),
      );
    }
    return null;
  }
}
