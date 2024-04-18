import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/src/controllers/categoryController/categoryController.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';

import '../../widgets/commonScaffold.dart';

class Categ extends StatelessWidget {
  CategoryController categoryController = Get.find<CategoryController>();
  Categ({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: body(),
      showDrawer: true,
    );
  }

  Widget body() {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width / 1.5,
                  alignment: Alignment.bottomCenter,
                  color: UIDataColors.whiteColor,
                  child: TextField(
                    style: const TextStyle(color: UIDataColors.blackColor),
                    onChanged: (value) =>
                        categoryController.filterCategory(value),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        labelText: "Search by category name",
                        labelStyle:
                            TextStyle(color: UIDataColors.midBlackColor),
                        suffixIcon: Icon(
                          Icons.search,
                          color: UIDataColors.midBlackColor,
                        )),
                  ).paddingOnly(top: 12),
                ),
                Container(
                  height: 60,
                  color: UIDataColors.blueColor,
                  child: TextButton(
                      onPressed: () {
                        categoryController.istrue.value = true;
                        categoryController.update();
                        // print('ffff');
                      },
                      child: const Text(
                        'Add New Category',
                        style: TextStyle(color: UIDataColors.whiteColor),
                      )).paddingSymmetric(horizontal: 50),
                )
              ],
            ).paddingSymmetric(vertical: 30, horizontal: 40),
            Expanded(
              // width: Get.width,
              // height: Get.height / 1.3,
              child: Obx(
                () => categoryController.j.value == 0
                    ? Center(
                        child: Text('hhhhhhhh'),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 180,
                                childAspectRatio: 1,
                                crossAxisSpacing: 70,
                                mainAxisSpacing: 70),
                        itemCount: categoryController.foundCategory.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              ' ${categoryController.foundCategory[index]["name"]}',
                              style: const TextStyle(
                                  color: UIDataColors.midBlackColor,
                                  fontSize: 20),
                            ).paddingSymmetric(vertical: 0, horizontal: 30),
                          );
                        }).paddingSymmetric(horizontal: 40, vertical: 30),
              ),
            ),
          ],
        ),
        // if (categoryController.istrue == true)
        Obx(
          () => categoryController.istrue.value == true
              ? SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: Color.fromARGB(255, 50, 112, 162),
                          height: Get.height / 2,
                          width: Get.width / 1.5,
                          child: Column(children: [
                            const Text(
                              'Add New Category',
                              style: TextStyle(
                                  color: UIDataColors.whiteColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22),
                            ).paddingOnly(top: 30, bottom: 30),
                            Obx(() {
                              return TextField(
                                cursorColor: UIDataColors.whiteColor,
                                style: const TextStyle(
                                    color: UIDataColors.whiteColor),
                                onChanged: (value) => categoryController
                                    .categNameCheck.value = true,
                                controller: categoryController.enterCategName,
                                decoration: categoryController
                                        .categNameCheck.value
                                    ? const InputDecoration(
                                        labelText: "Enter Category Name",
                                        labelStyle: TextStyle(
                                            color: UIDataColors.whiteColor),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: UIDataColors.borderColor,
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: UIDataColors.borderColor,
                                              width: 1),
                                        ))
                                    : const InputDecoration(
                                        labelText: "Category Name",
                                        helperText: "Name is required",
                                        labelStyle: TextStyle(
                                            color: UIDataColors.whiteColor),
                                        helperStyle: TextStyle(
                                            color: UIDataColors.errorColor),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          width: 1,
                                          color: UIDataColors.errorColor,
                                        )),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: UIDataColors.borderColor,
                                              width: 1),
                                        )),
                              ).paddingSymmetric(horizontal: 40, vertical: 20);
                            }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      categoryController.istrue.value = false;
                                      categoryController.enterCategName.clear();
                                      categoryController.update();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: UIDataColors.whiteColor),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      if (categoryController
                                              .enterCategName.text ==
                                          "") {
                                        categoryController
                                            .categNameCheck.value = false;
                                      } else {
                                        categoryController.sendData();
                                        categoryController.update();
                                        // customerService.customerService();
                                        categoryController.enterCategName
                                            .clear();
                                      }
                                    },
                                    child: const Text(
                                      'Add',
                                      style: TextStyle(
                                          color: UIDataColors.whiteColor),
                                    ))
                              ],
                            ).paddingOnly(top: 20, right: 30)
                          ]),
                        )
                      ]),
                )
              : SizedBox(),
        )
      ],
    );
  }
}
