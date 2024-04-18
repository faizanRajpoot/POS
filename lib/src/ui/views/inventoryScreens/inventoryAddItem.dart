// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/models/error.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';
import '../../../controllers/inventoryController/inventoryadditemcontroller.dart';
import '../../widgets/commonScaffold.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(),
      showDrawer: false,
    );
  }

  Widget bodyData() {
    var i = Get.arguments ?? '';

    return GetBuilder<InventoryAddItemController>(
        init: InventoryAddItemController(),
        builder: (_) {
          if (i != '') {
            var a = _.cs.allproducts[i] ?? '';
            _.updateCheck.value = true;
            _.nameController.text = a['name'];
            _.brandController.text = a['brand'];
            _.totalController.text = a['total'].toString();
            _.sellingController.text = a['selling'].toString();
            _.quantityController.text = a['quantity'].toString();
          }
          if (i == '') {
            _.nameController.text = '';
            _.brandController.text = '';
            _.totalController.text = '';
            _.sellingController.text = '';
            _.quantityController.text = '';
          }
          return Stack(
            children: [
              Column(children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  color: UIDataColors.whiteColor,
                  height: 600,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(() {
                          return TextFormField(
                            style: TextStyle(color: UIDataColors.midBlackColor),
                            onChanged: (value) => _.nameCheck.value = true,
                            controller: _.nameController,
                            onFieldSubmitted: (__) {
                              _.updateCheck.value ?_.Update2(i) : _.Update();
                              _.cs.fetchedItems();

                            },
                            decoration: _.nameCheck.value
                                ? InputDecoration(
                                    labelText: "Product Name",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
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
                                : InputDecoration(
                                    labelText: "Product Name",
                                    helperText: "Name is required",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
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
                          ).paddingSymmetric(horizontal: 20);
                        }),

                        Obx(() {
                          return TextFormField(
                            style: TextStyle(color: UIDataColors.midBlackColor),
                            onTap: () {
                              _.stack.value = true;
                              _.update;
                              _.add();
                              // print('ffff');
                            },
                            onChanged: (__) {
                              _.stack.value = true;
                              _.update;
                              _.add();
                              // print('ffff');
                            },
                            controller: _.selectCategory,
                            onFieldSubmitted: (__) {
                              _.updateCheck.value ?_.Update2(i) : _.Update();
                              _.cs.fetchedItems();
                            },
                            decoration: _.nameCheck.value
                                ? InputDecoration(
                                    labelText: "Select Category",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
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
                                : InputDecoration(
                                    labelText: "Select Category",
                                    helperText: "Category is required",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
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
                          ).paddingSymmetric(horizontal: 20);
                        }),

                        Obx(() {
                          return TextFormField(
                            style: TextStyle(color: UIDataColors.blackColor),
                            onChanged: (value) => _.brandCheck.value = true,
                            controller: _.brandController,
                            onFieldSubmitted: (__) {
                              _.updateCheck.value ?_.Update2(i) : _.Update();
                              _.cs.fetchedItems();
                            },
                            decoration: _.brandCheck.value
                                ? InputDecoration(
                                    labelText: "Brand Name",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
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
                                : InputDecoration(
                                    labelText: "Brand Name",
                                    helperText: "Brand is required",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
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
                          ).paddingSymmetric(horizontal: 20);
                        }),
                        Obx(() {
                          return TextFormField(
                            style: TextStyle(color: UIDataColors.midBlackColor),
                            onChanged: (value) => _.totalCheck.value = true,
                            controller: _.totalController,
                            onFieldSubmitted: (__) {
                              _.updateCheck.value ?_.Update2(i) : _.Update();
                              _.cs.fetchedItems();
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: _.totalCheck.value
                                ? InputDecoration(
                                    labelText: "Total Price",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
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
                                : InputDecoration(
                                    labelText: "Total Price",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
                                    helperText: "Total Price is required",
                                    helperStyle: TextStyle(
                                        color: UIDataColors.errorColor),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: UIDataColors.errorColor,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: UIDataColors.borderColor,
                                          width: 1),
                                    )),
                          ).paddingSymmetric(horizontal: 20);
                        }),
                        Obx(() {
                          return TextFormField(
                            style: TextStyle(color: UIDataColors.midBlackColor),
                            onChanged: (value) => _.sellingCheck.value = true,
                            controller: _.sellingController,
                            onFieldSubmitted: (__) {
                              _.updateCheck.value ?_.Update2(i) : _.Update();
                              _.cs.fetchedItems();
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: _.sellingCheck.value
                                ? InputDecoration(
                                    labelText: "Selling Price",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
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
                                : InputDecoration(
                                    labelText: "Selling Price",
                                    helperText: "Selling Price is required",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
                                    helperStyle: const TextStyle(
                                        color: UIDataColors.errorColor),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: UIDataColors.errorColor,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: UIDataColors.borderColor,
                                          width: 1),
                                    )),
                          ).paddingSymmetric(horizontal: 20);
                        }),
                        Obx(() {
                          return TextFormField(
                            style: TextStyle(color: UIDataColors.midBlackColor),
                            onChanged: (value) => _.quantityCheck.value = true,
                            controller: _.quantityController,
                            onFieldSubmitted: (__) {
                              _.updateCheck.value ?_.Update2(i) : _.Update();
                              _.cs.fetchedItems();
                              // _.Update();
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: _.quantityCheck.value
                                ? InputDecoration(
                                    labelText: "Quantity",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
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
                                : InputDecoration(
                                    labelText: "Quantity",
                                    helperText: "Quantity is required",
                                    labelStyle: TextStyle(
                                        color: UIDataColors.midBlackColor),
                                    helperStyle: const TextStyle(
                                        color: UIDataColors.errorColor),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: UIDataColors.errorColor,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: UIDataColors.borderColor,
                                          width: 1),
                                    )),
                          ).paddingSymmetric(horizontal: 20);
                        }),
                        // Container(
                        //   height: 180,
                        //   width: 400,
                        //   child: Obx(() {
                        //     return DropdownButtonHideUnderline(
                        //       child: DropdownButton<String>(
                        //         isExpanded: true,
                        //         hint: Text(
                        //           'Select Item',
                        //           style: TextStyle(
                        //             fontSize: 14,
                        //             color: Colors.amber,
                        //           ),
                        //         ),
                        //         items: _.items
                        //             .map((String item) => DropdownMenuItem<String>(
                        //                   value: item,
                        //                   child: Text(
                        //                     item,
                        //                     style: const TextStyle(
                        //                       fontSize: 14,
                        //                     ),
                        //                   ),
                        //                 ))
                        //             .toList(),
                        //         value: _.selectedValue.value,
                        //         onChanged: (String? value) {
                        //           _.setSelectedValue(value);
                        //         },
                        //         // buttonStyle: ButtonStyle(
                        //         //   padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                        //         //   height: MaterialStateProperty.all(40),
                        //         //   width: MaterialStateProperty.all(140),
                        //         // ),
                        //         itemHeight: 10, // Set the item height here
                        //       ),
                        //     );
                        //   }),
                        // )
                      ]),
                ).paddingAll(40),
                _.updateCheck.value
                    ? TextButton(

                        onPressed: () async {
                          _.Update2(i);
                          Get.offAndToNamed(Routes.inventory);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: UIDataColors.blueColor),
                          child: Text(
                            'Update',
                            style: TextStyle(
                                fontSize: 22, color: UIDataColors.whiteColor),
                          ).paddingSymmetric(vertical: 15, horizontal: 35),
                        ))
                    : TextButton(
                        onPressed: () {
                          if (_.nameController.text == "") {
                            _.nameCheck.value = false;
                          } else if (_.brandController.text == "") {
                            _.brandCheck.value = false;
                          } else if (_.totalController.text == "") {
                            _.totalCheck.value = false;
                          } else if (_.sellingController.text == "") {
                            _.sellingCheck.value = false;
                          } else if (_.quantityController.text == "") {
                            _.quantityCheck.value = false;
                          } else {
                            _.Update();
                            // _.nameController.clear();
                            // _.selectCategory.clear();
                            // _.brandController.clear();
                            // _.totalController.clear();
                            // _.sellingController.clear();
                            // _.quantityController.clear();
                            // _.imageController.clear();
                            // _.nameCheck.value = true;
                            // _.categoryCheck.value = true;
                            // _.brandCheck.value = true;
                            // _.totalCheck.value = true;
                            // _.sellingCheck.value = true;
                            // _.quantityCheck.value = true;
                            // _.appbarController.title.value = 'Inventory';
                            _.cs.fetchedItems();
                            _.update();
                            // Get.back();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: UIDataColors.blueColor),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 22, color: UIDataColors.whiteColor),
                          ).paddingSymmetric(vertical: 15, horizontal: 35),
                        )),
              ]),
              Obx(() => _.stack.value == true
                  ? Container(
                      width: Get.width,
                      height: 100,
                      color: Color.fromARGB(255, 215, 220, 229),
                      child: ListView.builder(
                          itemCount: _.data.length,
                          itemBuilder: (BuildContext context, index) {
                            return Column(
                              children: [
                                SingleChildScrollView(
                                  child: SizedBox(
                                    width: Get.width,
                                    height: 30,
                                    // color: Color.fromARGB(107, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () {
                                        _.selectCategory.text =
                                            _.data[index]['name'];
                                        _.stack.value = false;
                                      },
                                      child: Text(
                                        _.data[index]['name'],
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ).paddingSymmetric(
                                      vertical: 10, horizontal: 20),
                                )
                              ],
                            );
                          }),
                    ).paddingSymmetric(vertical: 215, horizontal: 60)
                  : SizedBox())
            ],
          );
        });
  }
}
