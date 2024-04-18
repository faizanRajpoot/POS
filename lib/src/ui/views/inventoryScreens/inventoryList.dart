// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';
import '../../../controllers/inventoryController/inventorylist_controller.dart';
import '../../widgets/commonScaffold.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(),
      showDrawer: false,
    );
  }

  Widget bodyData() {
    return GetBuilder<InventoryListController>(
      init: InventoryListController(),
      builder: (_) {
        return SizedBox(
            height: Get.height,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height / 1.5,
                  width: Get.width / 2.3,
                  color: Colors.cyan,
                  child: Image.asset(
                    '${_.v['image']}',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: Get.height / 2,
                  width: Get.width / 2.3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            "Product name:",
                            style: TextStyle(
                                fontSize: 20, color: UIDataColors.blackColor),
                          ),
                          Text("${_.v['name']}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200,
                                      color: UIDataColors.blackColor))
                              .paddingOnly(left: 20)
                        ]),
                        Row(children: [
                          Text(
                            "Product brand:",
                            style: TextStyle(
                                fontSize: 20, color: UIDataColors.blackColor),
                          ),
                          Text("${_.v['brand']}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200,
                                      color: UIDataColors.blackColor))
                              .paddingOnly(left: 20)
                        ]),
                        Row(children: [
                          Text(
                            "Product Quantity:",
                            style: TextStyle(
                                fontSize: 20, color: UIDataColors.blackColor),
                          ),
                          Text("${_.v['quantity']}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200,
                                      color: UIDataColors.blackColor))
                              .paddingOnly(left: 20)
                        ]),
                        Row(children: [
                          Text(
                            "Product Price:",
                            style: TextStyle(
                                fontSize: 20, color: UIDataColors.blackColor),
                          ),
                          Text("${_.v['total']}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200,
                                      color: UIDataColors.blackColor))
                              .paddingOnly(left: 20)
                        ]),
                        Row(children: [
                          Text(
                            "Product Selling Price:",
                            style: TextStyle(
                                fontSize: 20, color: UIDataColors.blackColor),
                          ),
                          Text("${_.v['selling']}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200,
                                      color: UIDataColors.blackColor))
                              .paddingOnly(left: 20)
                        ]),
                      ]),
                )
              ],
            )).paddingSymmetric(horizontal: 40);
      },
    );
  }
}
