import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primerapp/presenter/controller/setting_controller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Setting'),
        ),
        body:
        Center(child: Text(Get.find<SettingPageController>().title.value)));
  }
}