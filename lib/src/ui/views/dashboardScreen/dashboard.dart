// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/categoryController/categoryController.dart';
import 'package:flutter_application_1/src/controllers/customerController/customerController.dart';
import 'package:flutter_application_1/src/controllers/newsaleController/newsaleController.dart';
import 'package:flutter_application_1/src/services/customer.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';
import '../../../controllers/appbarController/appbarcontroller.dart';
import '../../../controllers/inventoryController/inventorycontroller.dart';
import '../../../utils/routes/routes.dart';
import '../../widgets/commonScaffold.dart';

class Dashboard extends StatelessWidget {
  CategoryController categoryController = Get.put(CategoryController());
  final AppbarController appbarController = Get.put(AppbarController());
  final InventoryController inventoryController =
      Get.put(InventoryController());

  final CustomerController customerController = Get.put(CustomerController());
  final CustomerService customerService = Get.put(CustomerService());
  final NewsaleController saleController = Get.put(NewsaleController());

  @override
  Widget build(BuildContext context) {
    @override
    Widget widget = SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(80),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Wrap(
              runSpacing: 50,
              alignment: WrapAlignment.center,
              spacing: 50,
              children: [
                InkWell(
                  onTap: () {
                    appbarController.title.value = 'Sales Record';
                    Get.toNamed(Routes.salesrecord);
                  },
                  child: Container(
                    width: Get.width / 2.5,
                    height: 230,
                    color: UIDataColors.whiteColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height,
                          child: Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.vertical,
                              spacing: 25,
                              children: [
                                Text(
                                  '${saleController.salesarray.length}',
                                  style: TextStyle(
                                      color: UIDataColors.blueColor,
                                      fontSize: 70,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  "Total Sales",
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w200),
                                ),
                              ]).paddingOnly(left: 30),
                        ),
                        Container(
                          height: Get.height,
                          width: Get.width / 7,
                          color: UIDataColors.blueColor,
                          child: Icon(
                            Icons.shopping_cart,
                            color: UIDataColors.whiteColor,
                            size: 90,
                          ),
                        ).paddingAll(7)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    appbarController.title.value = 'Customers';
                    Get.toNamed(Routes.customer);
                  },
                  child: Container(
                    width: Get.width / 2.5,
                    height: 230,
                    color: UIDataColors.whiteColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height,
                          child: Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.vertical,
                              spacing: 25,
                              children: [
                                Text(
                                  '${customerService.allCustomersLength.length}',
                                  style: TextStyle(
                                      color: UIDataColors.blueColor,
                                      fontSize: 70,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  "Total Cutomers",
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w200),
                                ),
                              ]).paddingOnly(left: 30),
                        ),
                        Container(
                          height: Get.height,
                          width: Get.width / 7,
                          color: Color(0xff6ED64A),
                          child: Icon(
                            Icons.supervised_user_circle_sharp,
                            color: UIDataColors.whiteColor,
                            size: 90,
                          ),
                        ).paddingAll(7)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    appbarController.title.value = 'Inventory';
                    Get.toNamed(Routes.inventory);
                  },
                  child: Container(
                    width: Get.width / 2.5,
                    height: 230,
                    color: UIDataColors.whiteColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height,
                          child: Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.vertical,
                              spacing: 25,
                              children: [
                                Text(
                                  '${customerService.allproducts.length}',
                                  style: TextStyle(
                                      color: UIDataColors.blueColor,
                                      fontSize: 70,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  "Total Items",
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w200),
                                ),
                              ]).paddingOnly(left: 30),
                        ),
                        Container(
                          height: Get.height,
                          width: Get.width / 7,
                          color: Color(0xffFC5D5D),
                          child: Icon(
                            Icons.inbox,
                            color: UIDataColors.whiteColor,
                            size: 90,
                          ),
                        ).paddingAll(7)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    appbarController.title.value = 'Category';
                    Get.toNamed(Routes.category);
                  },
                  child: Container(
                    width: Get.width / 2.5,
                    height: 230,
                    color: UIDataColors.whiteColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height,
                          child: Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.vertical,
                              spacing: 25,
                              children: [
                                Text(
                                  '${customerService.allcategory.length}',
                                  style: TextStyle(
                                      color: UIDataColors.blueColor,
                                      fontSize: 70,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w200),
                                ),
                              ]).paddingOnly(left: 30),
                        ),
                        Container(
                          height: Get.height,
                          width: Get.width / 7,
                          color: Color(0xffF7941C),
                          child: Icon(
                            Icons.control_point_duplicate,
                            color: UIDataColors.whiteColor,
                            size: 90,
                          ),
                        ).paddingAll(7)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    appbarController.title.value = 'Start new Sale';
                    Get.toNamed(Routes.newSale);
                  },
                  child: Container(
                    width: Get.width / 2.5,
                    height: 80,
                    color: UIDataColors.whiteColor,
                    child: Row(children: [
                      Icon(
                        Icons.shopping_cart,
                        color: UIDataColors.blackColor,
                      ).paddingOnly(left: 20),
                      Container(
                        height: 60,
                        width: 1.7,
                        color: UIDataColors.borderColor,
                      ).paddingSymmetric(horizontal: 20),
                      Text(
                        'Start a new Sale',
                        style: TextStyle(
                            color: UIDataColors.midBlackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w200),
                      )
                    ]),
                  ),
                ),
                InkWell(
                  child: Container(
                    width: Get.width / 2.5,
                    height: 80,
                    color: UIDataColors.whiteColor,
                    child: Row(children: [
                      Icon(
                        Icons.av_timer,
                        color: UIDataColors.blackColor,
                      ).paddingOnly(left: 20),
                      Container(
                        height: 60,
                        width: 1.7,
                        color: UIDataColors.borderColor,
                      ).paddingSymmetric(horizontal: 20),
                      Text(
                        'Todays detailed sales report',
                        style: TextStyle(
                            color: UIDataColors.midBlackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w200),
                      )
                    ]),
                  ),
                ),
              ]),
        ),
      ),
    );

    return CommonScaffold(
      bodyData: widget,
      showDrawer: true,
    );
  }
}
