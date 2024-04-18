import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/purchaseController/purchaseController.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../widgets/commonScaffold.dart';

class AddPurchase extends StatelessWidget {
  AddPurchase({super.key});
  PurchaseController controller = Get.find<PurchaseController>();
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: body(context),
      showDrawer: true,
    );
  }

  Widget body(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: UIDataColors.whiteColor,
      child: Structure(controller),
    ).paddingSymmetric(horizontal: 60, vertical: 60);
  }
}

// Structure
class Structure extends StatelessWidget {
  PurchaseController controller;
  Structure(this.controller);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ProductField
            ProductField(controller),
            // SupplierField
            SupplierField(controller)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // DateField
            DateField(controller),
            // Refrence Field
            ReferenceField(controller)
          ],
        ),
        // Purchase Item and total amount Container
        PurchaseItems(controller),
        // Buttons
        Buttons(controller),
      ]),
    ).paddingSymmetric(horizontal: 40);
  }
}

// ProductField
class ProductField extends StatelessWidget {
  PurchaseController controller;
  ProductField(this.controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Get.width / 3,
          height: 50,
          child: TextFormField(
              style: TextStyle(color: UIDataColors.midBlackColor),
              onChanged: (value) {
                controller.filterProduct(value);
                controller.productCheck.value = true;
              },
              controller: controller.itemsTextField,
              onFieldSubmitted: (__) {
                // _.updateCheck.value ? _.Update2(i) : _.Update();
                // _.cs.fetchedItems();
              },
              decoration: const InputDecoration(
                  labelText: "Product Name",
                  labelStyle: TextStyle(color: UIDataColors.midBlackColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: UIDataColors.borderColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: UIDataColors.borderColor, width: 1),
                  ))),
        ),
        Obx(() => controller.productCheck.value
            ? Container(
                width: Get.width / 3,
                height: 100,
                color: UIDataColors.borderColor,
                child: Obx(() => ListView.builder(
                    itemCount: controller.foundProduct.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                          controller.productCheck.value = false;
                          controller.itemsTextField.text = '';
                          controller.totalBillCheck.value = true;
                          controller.subTot = [];
                          controller.sum2 = '';
                          controller.sum.value = 0;

                          controller.addRow(
                            controller.foundProduct.value[index]['id'],
                            controller.foundProduct.value[index]['name'],
                            controller.foundProduct.value[index]['total'],
                          );
                          // controller.addData(index);
                        },
                        child: Container(
                          width: 50,
                          color: Colors.white,
                          child: Text(
                            controller.foundProduct[index]['name'].toString(),
                            style: TextStyle(color: Colors.black),
                          ).paddingSymmetric(vertical: 7, horizontal: 10),
                        ).paddingSymmetric(vertical: 1, horizontal: 1),
                      );
                    })),
              ).marginOnly(top: 50)
            : const SizedBox())
      ],
    );
  }
}

// SupplierField
class SupplierField extends StatelessWidget {
  PurchaseController controller;
  SupplierField(this.controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Get.width / 3,
          height: 50,
          child: TextFormField(
              style: const TextStyle(color: UIDataColors.midBlackColor),
              onChanged: (value) {
                controller.filterSupplier(value);
                controller.supplierCheck.value = true;
              },
              controller: controller.supplierTextField,
              onFieldSubmitted: (__) {
                // _.updateCheck.value ? _.Update2(i) : _.Update();
                // _.cs.fetchedItems();
              },
              decoration: const InputDecoration(
                  labelText: "Supplier Name",
                  labelStyle: TextStyle(color: UIDataColors.midBlackColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: UIDataColors.borderColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: UIDataColors.borderColor, width: 1),
                  ))),
        ),
        Obx(() => controller.supplierCheck.value
            ? Container(
                width: Get.width / 3,
                height: 100,
                color: UIDataColors.borderColor,
                child: Obx(() => ListView.builder(
                    itemCount: controller.foundSupplier.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                          controller.supplierTextField.text =
                              controller.foundSupplier[index]['Name'];
                          controller.suppliername.value =
                              controller.supplierTextField.text;
                          controller.supplierCheck.value = false;
                        },
                        child: Container(
                          width: 50,
                          color: Colors.white,
                          child: Text(
                            controller.foundSupplier[index]['Name'].toString(),
                            style: const TextStyle(color: Colors.black),
                          ).paddingSymmetric(vertical: 7, horizontal: 10),
                        ).paddingSymmetric(vertical: 1, horizontal: 1),
                      );
                    })),
              ).marginOnly(top: 50)
            : SizedBox())
      ],
    );
  }
}

// DateField
class DateField extends StatelessWidget {
  PurchaseController controller;
  DateField(this.controller);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width / 3,
        height: 50,
        child: TextFormField(
          onFieldSubmitted: (__) {
            // _.updateCheck.value ? _.Update2(i) : _.Update();
            // _.cs.fetchedItems();
          },
          style: TextStyle(color: UIDataColors.midBlackColor),
          controller: controller.dateinput,
          decoration: const InputDecoration(
              labelText: "Enter Date",
              labelStyle: TextStyle(color: UIDataColors.midBlackColor),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIDataColors.borderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIDataColors.borderColor, width: 1),
              )),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('EEE dd MMM yyyy hh:mm a').format(pickedDate);

              controller.dateinput.text = formattedDate;
            } else {
              print("Date is not selected");
            }
          },
        ));
  }
}

// Referrence Field
class ReferenceField extends StatelessWidget {
  PurchaseController controller;
  ReferenceField(this.controller);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 3,
      height: 50,
      child: TextFormField(
          style: TextStyle(color: UIDataColors.midBlackColor),
          // onChanged: (value) => _.nameCheck.value = true,
          // controller: _.nameController,
          onFieldSubmitted: (__) {
            // _.updateCheck.value ? _.Update2(i) : _.Update();
            // _.cs.fetchedItems();
          },
          decoration: const InputDecoration(
              labelText: "Refrence",
              labelStyle: TextStyle(color: UIDataColors.midBlackColor),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIDataColors.borderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIDataColors.borderColor, width: 1),
              ))),
    );
  }
}

// Purchase Items and Total
class PurchaseItems extends StatelessWidget {
  PurchaseController controller;
  PurchaseItems(this.controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width / 1.7,
          color: UIDataColors.borderColor,
          height: 300,
          child: Column(
            children: [
              //  Static Purchase Row
              StaticPurchaseItems(controller),
              // Dynmic Purchase Items
              DynamicPurchaseItems(controller),
            ],
          ),
        ),
        // Supplier and GrandTotal
        SupplierandTotal(controller)
      ],
    );
  }
}

// Supplier and grandtotal
class SupplierandTotal extends StatelessWidget {
  PurchaseController controller;
  SupplierandTotal(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 4,
      height: 300,
      color: UIDataColors.borderColor,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  // width: Get.width - 206,
                  height: 50,
                  color: UIDataColors.whiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Supplier Name',
                        style: TextStyle(color: UIDataColors.midBlackColor),
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.totalBillCheck.value) {
                            controller.totalBillButton();
                            controller.totalBillCheck.value = false;
                          }
                        },
                        child: const Text(
                          'Grand Total',
                          style: TextStyle(color: UIDataColors.midBlackColor),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 20),
                ).paddingSymmetric(vertical: 2, horizontal: 3),
              ),
            ],
          ),
          Container(
            height: 244,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  height: 100,
                  child: Obx(
                    () => Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.suppliername.value,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: UIDataColors.midBlackColor),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.supplierTextField.text = '';
                              controller.suppliername.value = '';
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: UIDataColors.errorColor,
                              size: 15,
                            ))
                      ],
                    ).paddingOnly(bottom: 40, left: 20),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 100,
                  child: Obx(
                    () => Text(
                      "Rs:${controller.sum.value}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: UIDataColors.midBlackColor),
                    ).paddingOnly(top: 20, left: 60),
                  ),
                )
              ],
            ),
          ).paddingSymmetric(horizontal: 3)
        ],
      ),
    );
  }
}

// Dynamic Purchase Items
class DynamicPurchaseItems extends StatelessWidget {
  PurchaseController controller;
  DynamicPurchaseItems(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 244,
      color: Colors.white,
      child: Obx(
        () => ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (BuildContext context, index) {
              controller.subtotal.value =
                  controller.data.value[index]['selling'];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${controller.data[index]['name']}',
                      style: const TextStyle(color: Colors.black),
                    ).paddingOnly(left: 20),
                  ),
                  Expanded(
                    child: Text('${controller.data[index]['selling']}',
                            style: const TextStyle(color: Colors.black))
                        .paddingOnly(left: 50),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      child: SizedBox(
                        width: 80,
                        height: 35,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: controller.data.value[index]['quantity'],
                          onTap: () {
                            controller.outsideCheck.value = true;
                            controller.j = index;
                            controller.subtotal.value =
                                controller.data.value[index]['selling'];
                          },
                          onTapOutside: (value) {
                            if (controller.outsideCheck.value) {
                              controller.data.value[controller.j]['subTotal'] =
                                  int.parse(controller.data
                                          .value[controller.j]['quantity'].text
                                          .toString()) *
                                      int.parse(controller
                                          .data.value[controller.j]['selling']
                                          .toString());

                              FocusScope.of(context).requestFocus(FocusNode());
                              controller.outsideCheck.value = false;
                            }
                          },
                          onChanged: (value) {
                            int v = int.tryParse(controller.data
                                    .value[controller.j]['quantity'].text) ??
                                0;
                            controller.data.value[controller.j]['subTotal'] =
                                v *
                                    int.parse(controller
                                        .data.value[controller.j]['selling']
                                        .toString());

                            controller.outsideCheck.value = false;
                          },
                          style: const TextStyle(
                              color: UIDataColors.midBlackColor),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: UIDataColors.borderColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: UIDataColors.borderColor)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: UIDataColors.midBlackColor),
                              labelText: "Set Quantity",
                              labelStyle: TextStyle(
                                  fontSize: 12,
                                  color: UIDataColors.midBlackColor)),
                        ),
                      ),
                    ).paddingOnly(left: 60),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: Get.width / 1.5 / 5,
                      child: SizedBox(
                        width: Get.width / 1.5 / 5 / 2,
                        child: Obx(() => controller.outsideCheck.value
                            ? Text(
                                controller.data.value[index]['subTotal']
                                    .toString(),
                                style: const TextStyle(
                                    color: UIDataColors.midBlackColor),
                              ).paddingOnly(left: 50)
                            : Text(
                                controller.data.value[index]['subTotal']
                                    .toString(),
                                style: const TextStyle(
                                    color: UIDataColors.midBlackColor),
                              ).paddingOnly(left: 50)),
                      ),
                    ).paddingOnly(left: 50),
                  ),
                  Expanded(
                    child: SizedBox(
                      // width: 10,
                      child: IconButton(
                          icon: const Icon(Icons.delete,
                              color: UIDataColors.errorColor),
                          onPressed: () {
                            controller.deleteProduct(index);
                            // controller.su
                          }).paddingOnly(left: 60),
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: 10);
            }),
      ),
    ).paddingSymmetric(vertical: 0, horizontal: 3);
  }
}

// Static Purchase Row
class StaticPurchaseItems extends StatelessWidget {
  PurchaseController controller;
  StaticPurchaseItems(this.controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: Get.width - 206,
            height: 50,
            color: UIDataColors.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Product Name',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Product Price',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Product Qty',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Subtotal',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Actions',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
          ).paddingSymmetric(vertical: 2, horizontal: 3),
        ),
      ],
    );
  }
}

// Buttons
class Buttons extends StatelessWidget {
  PurchaseController controller;
  Buttons(this.controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              Get.back();
              controller.appbarController.title.value = 'Purchase';
              controller.cancel();
            },
            child: const Text('Cancel')),
        ElevatedButton(
            onPressed: () {
              controller.addPurchase();
              Get.back();
              controller.cancel();
            },
            child: const Text('Add Purchase'))
      ],
    );
  }
}
