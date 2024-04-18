// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../controllers/inventoryController/inventoryadditemcontroller.dart';
import '../../../controllers/inventoryController/inventorycontroller.dart';
import '../../../utils/routes/routes.dart';
import '../../widgets/commonScaffold.dart';

class Inventory extends StatelessWidget {
  final InventoryAddItemController addItemController =
      Get.put(InventoryAddItemController());

  Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(),
      showDrawer: true,
    );
  }

  Widget bodyData() {
    return GetBuilder<InventoryController>(
        init: InventoryController(),
        builder: (_) {
          return Column(children: [
            Row(
              children: [
                Container(
                  width: Get.width / 3,
                  alignment: Alignment.bottomCenter,
                  color: UIDataColors.whiteColor,
                  child: TextField(
                    style: TextStyle(color: UIDataColors.blackColor),
                    onChanged: (value) => _.filterProduct(value),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        labelText: "Search by name",
                        labelStyle:
                            TextStyle(color: UIDataColors.midBlackColor),
                        suffixIcon: Icon(
                          Icons.search,
                          color: UIDataColors.midBlackColor,
                        )),
                  ).paddingOnly(top: 12),
                ).paddingAll(40),
                Container(
                  width: Get.width / 3,
                  alignment: Alignment.bottomCenter,
                  color: UIDataColors.whiteColor,
                  child: TextField(
                    style: TextStyle(color: UIDataColors.blackColor),
                    onChanged: (value) => _.filterBrand(value),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        labelText: "Search by brand",
                        labelStyle:
                            TextStyle(color: UIDataColors.midBlackColor),
                        suffixIcon: Icon(
                          Icons.search,
                          color: UIDataColors.midBlackColor,
                        )),
                  ).paddingOnly(top: 12),
                ).paddingAll(40),
                Container(
                    width: Get.width / 6,
                    height: 60,
                    color: UIDataColors.blueColor,
                    child: TextButton(
                      onPressed: () {
                        _.appbarController.title.value = 'Add New Item';
                        Get.toNamed(Routes.inventoryAddItem);
                      },
                      child: Text(
                        'Add new item',
                        style: TextStyle(
                            color: UIDataColors.whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    )).paddingAll(40),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xff888888))),
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        // color: UIDataColors.whiteColor,
                        // width: Get.width / 5,
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Names',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UIDataColors.midBlackColor),
                      ).paddingOnly(left: 20),
                    )),
                    Container(
                        // color: UIDataColors.whiteColor,
                        // width: Get.width / 5,
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Category',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UIDataColors.midBlackColor),
                      ).paddingOnly(left: 0),
                    )),
                    Container(
                        // color: UIDataColors.whiteColor,
                        // width: Get.width / 5,
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Brand',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UIDataColors.midBlackColor),
                      ),
                    )),
                    Container(
                        // color: UIDataColors.whiteColor,
                        // width: Get.width / 5,
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Total Price',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UIDataColors.midBlackColor),
                      ),
                    )),
                    Container(
                        // color: UIDataColors.whiteColor,
                        // width: Get.width / 5,
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Selling Price',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UIDataColors.midBlackColor),
                      ),
                    )),
                    Container(
                        // color: UIDataColors.whiteColor,
                        // width: 206,
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Quantity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UIDataColors.midBlackColor),
                      ),
                    )),
                    Container(
                        // color: UIDataColors.whiteColor,
                        // width: 206,
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Delete/Edit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UIDataColors.midBlackColor),
                      ),
                    )).paddingOnly(right: 20)
                  ]),
            ).paddingSymmetric(horizontal: 40),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: _.cs.allproducts.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _.appbarController.title.value = 'Inventory';
                              Get.toNamed(Routes.inventoryList, arguments: {
                                "productValue": _.cs.allproducts[index]
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            width: 1,
                                            color: UIDataColors.borderColor),
                                        right: BorderSide(
                                            width: 1,
                                            color: UIDataColors.borderColor),
                                        bottom: BorderSide(
                                            width: 1,
                                            color: UIDataColors.borderColor))),
                                child: Row(
                                  // mainAxisAlignment:
                                  // MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: Get.width / 6.5,
                                      color: UIDataColors.whiteColor,
                                      child: Text(
                                        _.cs.allproducts[index]['name'],
                                        softWrap: false,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            color: UIDataColors.midBlackColor),
                                      ).paddingSymmetric(
                                          vertical: 22, horizontal: 20),
                                    ),
                                    Container(
                                        width: Get.width / 6.5,
                                        color: UIDataColors.whiteColor,
                                        child: Text(
                                                _.cs.allproducts[index]
                                                    ['category'],
                                                style: TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor))
                                            .paddingSymmetric(vertical: 22)),
                                    Container(
                                        width: Get.width / 6.5,
                                        color: UIDataColors.whiteColor,
                                        child: Text(
                                                _.cs.allproducts[index]
                                                    ['brand'],
                                                // 'ss',
                                                style: TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor))
                                            .paddingSymmetric(vertical: 22)),
                                    Container(
                                        width: Get.width / 6.5,
                                        color: UIDataColors.whiteColor,
                                        child: Text(
                                                _.cs.allproducts[index]['total']
                                                    .toString(),
                                                // 'ss',
                                                style: TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor))
                                            .paddingSymmetric(vertical: 22)),
                                    Container(
                                        width: Get.width / 6.5,
                                        color: UIDataColors.whiteColor,
                                        child: Text(
                                                _
                                                    .cs
                                                    .allproducts[index]
                                                        ['selling']
                                                    .toString(),
                                                // 'ss',
                                                style: TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor))
                                            .paddingSymmetric(vertical: 22)),
                                    Container(
                                        // width: Get.width / 5,
                                        color: UIDataColors.whiteColor,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text(
                                                      _
                                                          .cs
                                                          .allproducts[index]
                                                              ['quantity']
                                                          .toString(),
                                                      // 'ss',
                                                      style: TextStyle(
                                                          color: UIDataColors
                                                              .midBlackColor))
                                                  .paddingSymmetric(
                                                      vertical: 22),
                                            ).paddingOnly(right: 70),
                                            IconButton(
                                                onPressed: () {
                                                  _.deleteProduct(index);
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color:
                                                      UIDataColors.errorColor,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  addItemController
                                                      .updateCheck.value = true;
                                                  Get.toNamed(
                                                      Routes.inventoryAddItem,
                                                      arguments: index);
                                                  // _.cs.i = index;
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: UIDataColors.blueColor,
                                                )).paddingOnly(right: 0),
                                          ],
                                        )),
                                  ],
                                )).paddingSymmetric(
                              horizontal: 40,
                            ),
                          )
                        ],
                      );
                    })))
          ]);
        });
  }
}
