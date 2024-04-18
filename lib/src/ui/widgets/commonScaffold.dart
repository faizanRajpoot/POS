// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/widgets/drawer.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';
import '../../controllers/appbarController/appbarcontroller.dart';

class CommonScaffold extends StatelessWidget {
  final AppbarController appbarController = Get.put(AppbarController());

  final appBar;
  final showDrawer;
  final Widget bodyData;

  CommonScaffold(
      {super.key,
      this.appBar = false,
      required this.bodyData,
      this.showDrawer = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8EBEE),
      appBar: AppBar(
        backgroundColor: UIDataColors.blueColor,
        title: Obx(() => Text(appbarController.title.value)),
      ),
      
      drawer: showDrawer
          ? MyDrawer(
              backgroundColor: const Color.fromARGB(255, 132, 124, 124),
              child: ListView())
          : null,
      body: bodyData,
    );
  }
}
