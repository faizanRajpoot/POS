import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/controllers/customerController/customerController.dart';
import 'package:flutter_application_1/src/controllers/newsaleController/newsaleController.dart';
import 'package:flutter_application_1/src/services/customer.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';

import '../../../utils/config/uidata.dart';
import '../../widgets/commonScaffold.dart';

class Customer extends StatelessWidget {
  NewsaleController saleController = Get.put(NewsaleController());
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
    return GetBuilder<CustomerController>(builder: (_) {
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
                      onChanged: (value) => _.filterCustomer(value),
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
                  ),
                  Container(
                    height: 60,
                    color: UIDataColors.blueColor,
                    child: TextButton(
                        onPressed: () {
                          _.istrue = true;
                          _.update();
                        },
                        child: const Text(
                          'Add Customer',
                          style: TextStyle(color: UIDataColors.whiteColor),
                        )).paddingSymmetric(horizontal: 50),
                  )
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: UIDataColors.borderColor)),
                  height: 50,
                  child: Container(
                    color: UIDataColors.whiteColor,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(
                              child: Text(
                            'First Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: UIDataColors.midBlackColor),
                          )).paddingOnly(left: 100),
                          const Align(
                              child: Text(
                            'Last Name',
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
                      itemCount: _.foundCustomer.length,
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
                                                Get.toNamed(Routes.newSale,
                                                    arguments: {
                                                      'selectedCustomer':
                                                          _.foundCustomer[index]
                                                              ['firstName'],
                                                    });
                                                saleController.fetchData();
                                                // print(
                                                //     "${_.foundCustomer[index]['firstName']} routeee");
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color:
                                                    UIDataColors.midBlackColor,
                                              )).paddingOnly(left: 20),
                                          Text(
                                            _.foundCustomer[index]['firstName'],
                                            style: const TextStyle(
                                                color:
                                                    UIDataColors.midBlackColor),
                                          ).paddingSymmetric(
                                              vertical: 22, horizontal: 40),
                                        ],
                                      ),
                                      Text(
                                        _.foundCustomer[index]['lastName'],
                                        style: const TextStyle(
                                            color: UIDataColors.midBlackColor),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: Text(
                                                _.foundCustomer[index]['phNum']
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor)),
                                          ),
                                          IconButton(
                                                  onPressed: () {
                                                    _.deleteCustomer(index);
                                                    customerService
                                                            .allCustomersLength =
                                                        _.foundCustomer;
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color:
                                                        UIDataColors.errorColor,
                                                  ))
                                              .paddingOnly(right: 80, left: 30),
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
          if (_.istrue)
            SizedBox(
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
                          'Add First name Last name and Phone Number',
                          style: TextStyle(
                              color: UIDataColors.whiteColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 22),
                        ).paddingOnly(top: 30, bottom: 30),
                        Obx(() {
                          return TextField(
                            cursorColor: UIDataColors.whiteColor,
                            style:
                                const TextStyle(color: UIDataColors.whiteColor),
                            onChanged: (value) => _.firstnameCheck.value = true,
                            controller: _.enterFirstName,
                            decoration: _.firstnameCheck.value
                                ? const InputDecoration(
                                    labelText: "Enter First Name",
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
                                    labelText: "First Name",
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
                            style:
                                const TextStyle(color: UIDataColors.whiteColor),
                            onChanged: (value) => _.lastnameCheck.value = true,
                            controller: _.enterLastName,
                            decoration: _.lastnameCheck.value
                                ? const InputDecoration(
                                    labelText: "Enter Last Name",
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
                                    labelText: "Last Name",
                                    helperText: "Last Name is required",
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
                            style:
                                const TextStyle(color: UIDataColors.whiteColor),
                            onChanged: (value) =>
                                _.phonenumberCheck.value = true,
                            controller: _.enterPhoneNumber,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: _.phonenumberCheck.value
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
                                  _.istrue = false;
                                  _.enterFirstName.clear();
                                  _.enterLastName.clear();
                                  _.enterPhoneNumber.clear();

                                  // print(_.foundCustomer[0]['firstName']);
                                  _.update();
                                },
                                child: const Text(
                                  'Cancel',
                                  style:
                                      TextStyle(color: UIDataColors.whiteColor),
                                )),
                            TextButton(
                                onPressed: () {
                                  if (_.enterFirstName.text == "") {
                                    _.firstnameCheck.value = false;
                                  } else if (_.enterLastName.text == "") {
                                    _.lastnameCheck.value = false;
                                  } else if (_.enterPhoneNumber.text == "") {
                                    _.phonenumberCheck.value = false;
                                  } else {
                                    _.sendData();
                                    _.update();
                                    customerService.customerService();
                                    _.enterFirstName.clear();
                                    _.enterLastName.clear();
                                    _.enterPhoneNumber.clear();
                                    _.firstnameCheck.value = true;
                                    _.lastnameCheck.value = true;
                                    _.phonenumberCheck.value = true;
                                  }
                                },
                                child: const Text(
                                  'Add',
                                  style:
                                      TextStyle(color: UIDataColors.whiteColor),
                                ))
                          ],
                        ).paddingOnly(top: 20, right: 30)
                      ]),
                    )
                  ]),
            )
        ],
      );
    });
  }
}
