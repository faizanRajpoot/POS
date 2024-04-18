import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/controllers/supplier/supplierController.dart';
import 'package:flutter_application_1/src/ui/widgets/commonScaffold.dart';
import 'package:get/get.dart';

import '../../../services/customer.dart';
import '../../../utils/config/uidata.dart';

class Supplier extends StatelessWidget {
  // NewsaleController saleController = Get.put(NewsaleController());
  SupplierController supplierController = Get.find<SupplierController>();
  final CustomerService customerService = Get.put(CustomerService());


//  const Customer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(),
      showDrawer: true,
    );
  }

  Widget bodyData() {
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
                        supplierController.filterSupplier(value),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        labelText: "Search by supplier name",
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
                        supplierController.istrue.value = true;
                        supplierController.update();
                      },
                      child: const Text(
                        'Add Supplier',
                        style: TextStyle(color: UIDataColors.whiteColor),
                      )).paddingSymmetric(horizontal: 50),
                )
              ],
            ),
            Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: UIDataColors.borderColor)),
                height: 50,
                child: Container(
                  color: UIDataColors.whiteColor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Align(
                            child: Text(
                          'Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: UIDataColors.midBlackColor),
                        )).paddingOnly(left: 100),
                        const Align(
                            child: Text(
                          'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: UIDataColors.midBlackColor),
                        )),
                        const Align(
                          child: Text(
                            'Phone Number',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: UIDataColors.midBlackColor),
                          ),
                        ).paddingOnly(right: 100),
                      ]),
                )).paddingOnly(top: 40),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: supplierController.foundSupplier.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
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
                              child: Container(
                                color: UIDataColors.whiteColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              // Get.toNamed(
                                              //   Routes.newSale,
                                              //   arguments: {
                                              //       'selectedSupplier':
                                              //           supplierController.foundSupplier[index]
                                              //               ['Name'],
                                              //     }
                                              //     );
                                              // saleController.fetchData();
                                              // print(
                                              //     "${_.foundCustomer[index]['firstName']} routeee");
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: UIDataColors.midBlackColor,
                                            )).paddingOnly(left: 20),
                                        Text(
                                          supplierController
                                              .foundSupplier[index]['Name'].toString(),
                                          style: const TextStyle(
                                              color:
                                                  UIDataColors.midBlackColor),
                                        ).paddingSymmetric(
                                            vertical: 22, horizontal: 40),
                                      ],
                                    ),
                                    Text(
                                      supplierController.foundSupplier[index]
                                          ['Email'].toString(),
                                      style: const TextStyle(
                                          color: UIDataColors.midBlackColor),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          child: Text(
                                              supplierController
                                                  .foundSupplier[index]['phNum']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: UIDataColors
                                                      .midBlackColor)),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              supplierController
                                                  .deleteSupplier(index);
                                              customerService
                                                      .allSupplierLength =
                                                  supplierController.foundSupplier;
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: UIDataColors.errorColor,
                                            )).paddingOnly(right: 80, left: 30),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      );
                    })))
          ],
        ).paddingAll(40),
        Obx(
          () => (supplierController.istrue.value)
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
                              'Add Supplier name, email and Phone Number',
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
                                onChanged: (value) =>
                                    supplierController.nameCheck.value = true,
                                controller: supplierController.enterName,
                                decoration: supplierController.nameCheck.value
                                    ? const InputDecoration(
                                        labelText: "Enter Name",
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
                                        labelText: "Enter Name",
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
                            Obx(() {
                              return TextField(
                                cursorColor: UIDataColors.whiteColor,
                                style: const TextStyle(
                                    color: UIDataColors.whiteColor),
                                onChanged: (value) =>
                                    supplierController.emailCheck.value = true,
                                controller: supplierController.enterEmail,
                                decoration: supplierController.emailCheck.value
                                    ? const InputDecoration(
                                        labelText: "Enter Email",
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
                                        labelText: "Email",
                                        helperText: "Email is required",
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
                            Obx(() {
                              return TextField(
                                cursorColor: UIDataColors.whiteColor,
                                style: const TextStyle(
                                    color: UIDataColors.whiteColor),
                                onChanged: (value) => supplierController
                                    .phonenumberCheck.value = true,
                                controller: supplierController.enterPhoneNumber,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: supplierController
                                        .phonenumberCheck.value
                                    ? const InputDecoration(
                                        labelText: "Enter Phone Number",
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
                                        labelText: "Phone Number",
                                        helperText: "Phone Number required",
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
                                      supplierController.istrue.value = false;
                                      supplierController.enterName.clear();
                                      supplierController.enterEmail.clear();
                                      supplierController.enterPhoneNumber
                                          .clear();
                                      // print(_.foundCustomer[0]['firstName']);
                                      supplierController.update();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: UIDataColors.whiteColor),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      if (supplierController.enterName.text ==
                                          "") {
                                        supplierController.nameCheck.value =
                                            false;
                                      } else if (supplierController
                                              .enterEmail.text ==
                                          "") {
                                        supplierController.emailCheck.value =
                                            false;
                                      } else if (supplierController
                                              .enterPhoneNumber.text ==
                                          "") {
                                        supplierController
                                            .phonenumberCheck.value = false;
                                      } else {
                                        supplierController.sendData();
                                        supplierController.update();
                                        customerService.supplierService();
                                        supplierController.enterName.clear();
                                        supplierController.enterEmail.clear();
                                        supplierController.enterPhoneNumber
                                            .clear();
                                        supplierController.nameCheck.value =
                                            true;
                                        supplierController.emailCheck.value =
                                            true;
                                        supplierController
                                            .phonenumberCheck.value = true;
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
