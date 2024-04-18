// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/loginController/logincontroller.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';
import '../../../controllers/appbarController/appbarcontroller.dart';

class LoginPage extends StatelessWidget {
  final AppbarController appbarController = Get.put(AppbarController());
  // FakeService auth = Get.find<FakeService>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
          backgroundColor: Color(0xffE8EBEE),
          body: Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // height: Get.height / 1.6,
                  width: Get.width / 2.7,
                  color: UIDataColors.whiteColor,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height / 7,
                          color: UIDataColors.blueColor,
                          child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'images/header_logo.png',
                                height: 70,
                              )),
                        ),
                        Container(
                          width: Get.width,
                          child: Column(children: [
                            Text(
                              'Welcome to the Point Of Sale System. To continue, please login using your username and password below.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  height: 1.5,
                                  color: UIDataColors.blackColor),
                            ),
                            Text(
                              'Press login to continue',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: UIDataColors.blackColor),
                            ).paddingSymmetric(vertical: 20),
                            TextField(
                              controller: _.usernameController,
                              style: TextStyle(
                                fontSize: 14,
                                color: UIDataColors.blackColor,
                                fontWeight: FontWeight.w200,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle:
                                    TextStyle(color: UIDataColors.blackColor),
                                hintText: '',
                                hintStyle:
                                    TextStyle(color: UIDataColors.blackColor),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: UIDataColors.borderColor,
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: UIDataColors.borderColor,
                                      width: 1.5),
                                ),
                              ),
                            ),
                            Obx(
                              () => TextField(
                                controller: _.passwordController,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: UIDataColors.blackColor,
                                  fontWeight: FontWeight.w200,
                                ),
                                maxLength: 10,
                                keyboardType: TextInputType.text,
                                obscureText: !_.passwordVisible.value,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: '',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: UIDataColors.blackColor,
                                      fontWeight: FontWeight.w200),
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      color: UIDataColors.blackColor,
                                      fontWeight: FontWeight.w200),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: UIDataColors.borderColor,
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: UIDataColors.borderColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: UIDataColors.borderColor,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _.passwordVisible.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                    onPressed: () {
                                      _.passwordVisible.toggle();
                                    },
                                  ),
                                ),
                              ).paddingOnly(top: 20),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(() => _.apiService.errormessage.value
                                      ? Text(
                                          'Invalid username and password',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  239, 78, 78, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w200),
                                        )
                                      : Text('')),
                                  Text(
                                    'Reset password?',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: UIDataColors.blackColor,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ]).paddingOnly(bottom: 50),
                            GestureDetector(
                              onTap: () {
                                appbarController.title.value = 'Dashboard';
                                // Get.toNamed(Routes.dashboard)
                                _.isLoading.value ? null : _.login();
                              },
                              child: Container(
                                  width: Get.width,
                                  // height: 40,
                                  color: UIDataColors.blueColor,
                                  child: Obx(() {
                                    return _.isLoading.value
                                        ? CircularProgressIndicator()
                                        : Text(
                                            'LOGIN',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                                color: UIDataColors.whiteColor),
                                          ).paddingSymmetric(vertical: 12);
                                  })),
                            )
                          ]).paddingAll(40),
                        )
                      ]),
                )
              ],
            ),
          ));
    });
  }
}
