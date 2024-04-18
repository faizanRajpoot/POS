import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/newsaleController/newsaleController.dart';
import 'package:flutter_application_1/src/ui/widgets/commonScaffold.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';

class Salesrecord extends StatelessWidget {
  const Salesrecord({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: body(),
      showDrawer: true,
    );
  }

  Widget body() {
    return GetBuilder<NewsaleController>(
        init: NewsaleController(),
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
                color: Colors.white,
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: UIDataColors.borderColor)),
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Product Name',
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor),
                                ),
                                Text(
                                  'Product Qty',
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor),
                                ),
                                Text(
                                  'Product Price',
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor),
                                ),
                                Text(
                                  'Subtotal',
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor),
                                ),
                                Text(
                                  'Customer Name',
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor),
                                ),
                                Text(
                                  'Total Price',
                                  style: TextStyle(
                                      color: UIDataColors.midBlackColor),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 20),
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _.salesarray.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: UIDataColors.borderColor)),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: _
                                                .salesarray[index]['name']
                                                .length,
                                            itemBuilder:
                                                (BuildContext context, i) {
                                              return Text(
                                                "${_.salesarray[index]['name'][i]}",
                                                style: const TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor),
                                              ).paddingOnly(bottom: 5);
                                            }),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: _
                                                .salesarray[index]['qty']
                                                .length,
                                            itemBuilder:
                                                (BuildContext context, i) {
                                              return Text(
                                                "${_.salesarray[index]['qty'][i]}",
                                                style: const TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor),
                                              ).paddingOnly(bottom: 5);
                                            }),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: _
                                                .salesarray[index]['price']
                                                .length,
                                            itemBuilder:
                                                (BuildContext context, i) {
                                              return Text(
                                                "${_.salesarray[index]['price'][i]}",
                                                style: const TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor),
                                              ).paddingOnly(bottom: 5);
                                            }),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: _
                                                .salesarray[index]['subprice']
                                                .length,
                                            itemBuilder:
                                                (BuildContext context, i) {
                                              return Text(
                                                "${_.salesarray[index]['subprice'][i]}",
                                                style: const TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor),
                                              ).paddingOnly(bottom: 5);
                                            }),
                                      ),
                                      Expanded(
                                        child: Text(
                                            _.salesarray[index]['customer'],
                                            style: const TextStyle(
                                                color: UIDataColors
                                                    .midBlackColor)),
                                      ),
                                      Text(_.salesarray[index]['total'],
                                          style: const TextStyle(
                                              color:
                                                  UIDataColors.midBlackColor)),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: 20, vertical: 20),
                                ).paddingOnly(bottom: 0)
                              ],
                            ),
                          );
                        })
                  ],
                )).marginSymmetric(horizontal: 50, vertical: 100),
          );
        });
  }
}
