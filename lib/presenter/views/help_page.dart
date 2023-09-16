import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primerapp/presenter/controller/help_controller.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Help'),
        ),
        body:
        Center(child: Text(Get.find<HelpPageController>().title.value)));
  }
}