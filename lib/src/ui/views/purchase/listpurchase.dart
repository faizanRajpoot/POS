import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/appbarController/appbarcontroller.dart';
import 'package:flutter_application_1/src/controllers/newsaleController/newsaleController.dart';
import 'package:flutter_application_1/src/controllers/purchaseController/purchaseController.dart';
import 'package:flutter_application_1/src/ui/widgets/commonScaffold.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';

import '../../../utils/routes/routes.dart';

class ListPurchase extends StatelessWidget {
  final PurchaseController _ = Get.find<PurchaseController>();
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: body(),
      showDrawer: true,
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Add Purchase button
          AddPurchaseButton(_),
          // Structure
          Structure(_),
        ],
      ),
    );
  }
}

// Structure
class Structure extends StatelessWidget {
  PurchaseController _;
  Structure(this._);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Static Purchase Container
            StaticPurchaseContainer(_),
            // Dynamic Purchase Container
            DynamicPurchaseContainer(_),
          ],
        )).marginSymmetric(horizontal: 50, vertical: 40);
  }
}

// Add Purchase button
class AddPurchaseButton extends StatelessWidget {
  PurchaseController _;
  AddPurchaseButton(this._);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width / 6,
        height: 60,
        color: UIDataColors.blueColor,
        child: TextButton(
          onPressed: () {
            _.appbarController.title.value = 'Add Purchase';
            Get.toNamed(Routes.addpurchase);
          },
          child: const Text(
            'Add Purchase',
            style: TextStyle(
                color: UIDataColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w300),
          ),
        )).paddingOnly(right: 60, top: 40);
  }
}

// Static Purchase Container
class StaticPurchaseContainer extends StatelessWidget {
  PurchaseController _;
  StaticPurchaseContainer(this._);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: UIDataColors.borderColor)),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Date',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Product Name',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Product Qty',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Product Price',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Subtotal',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Supplier Name',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Total Price',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
          ),
        )
      ],
    );
  }
}

// Dynamic Purchase Container
class DynamicPurchaseContainer extends StatelessWidget {
  PurchaseController _;
  DynamicPurchaseContainer(this._);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 600,
      child: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            itemCount: _.damypurchase.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: UIDataColors.borderColor)),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('${_.damypurchase[index]['date']}',
                                style: const TextStyle(
                                    color: UIDataColors.midBlackColor)),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: jsonDecode(
                                        _.damypurchase[index]['productname'])
                                    .cast<String>()
                                    .length,
                                itemBuilder: (BuildContext context, i) {
                                  return Text(
                                    "${jsonDecode(_.damypurchase[index]['productname']).cast<String>()[i]}",
                                    style: const TextStyle(
                                        color: UIDataColors.midBlackColor),
                                  ).paddingOnly(bottom: 5);
                                }),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: jsonDecode(
                                        _.damypurchase[index]['productqty'])
                                    .cast<String>()
                                    .length,
                                itemBuilder: (BuildContext context, i) {
                                  return Text(
                                    "${jsonDecode(_.damypurchase[index]['productqty']).cast<String>()[i]}",
                                    style: const TextStyle(
                                        color: UIDataColors.midBlackColor),
                                  ).paddingOnly(bottom: 5);
                                }),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: jsonDecode(
                                        _.damypurchase[index]['productqty'])
                                    .cast<String>()
                                    .length,
                                itemBuilder: (BuildContext context, i) {
                                  return Text(
                                    "${jsonDecode(_.damypurchase[index]['productprice']).cast<String>()[i]}",
                                    style: const TextStyle(
                                        color: UIDataColors.midBlackColor),
                                  ).paddingOnly(bottom: 5);
                                }),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: jsonDecode(
                                        _.damypurchase[index]['subtotal'])
                                    .cast<String>()
                                    .length,
                                itemBuilder: (BuildContext context, i) {
                                  return Text(
                                    "${jsonDecode(_.damypurchase[index]['subtotal']).cast<String>()[i]}",
                                    style: const TextStyle(
                                        color: UIDataColors.midBlackColor),
                                  ).paddingOnly(bottom: 5);
                                }),
                          ),
                          Expanded(
                            child: Text(
                                '${_.damypurchase[index]['suppliername']}',
                                style: const TextStyle(
                                    color: UIDataColors.midBlackColor)),
                          ),
                          Text(_.damypurchase[index]['grandtotal'].toString(),
                              style: const TextStyle(
                                  color: UIDataColors.midBlackColor)),
                        ],
                      ).paddingSymmetric(horizontal: 20, vertical: 20),
                    ).paddingOnly(bottom: 0)
                  ],
                ),
              );
            }),
      ),
    );
  }
}
