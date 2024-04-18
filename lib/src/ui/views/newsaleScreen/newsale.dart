// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';
import '../../../controllers/newsaleController/newsaleController.dart';
import '../../widgets/commonScaffold.dart';

class Newsale extends StatelessWidget {
  const Newsale({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(),
      showDrawer: true,
    );
  }

  Widget bodyData() {
    return GetBuilder<NewsaleController>(
        init: NewsaleController(),
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Side Container
              LeftSideContainer(_),
              // Main Right side Add to Cart Container
              RightSideContainer(_)
            ],
          ).paddingAll(40);
        });
  }
}

class SearchBar extends StatelessWidget {
  NewsaleController _;
  SearchBar(this._);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: UIDataColors.whiteColor),
      height: 80,
      alignment: Alignment.center,
      child: SizedBox(
          width: Get.width / 1.5 / 1.1,
          // Searchbar Text Field and stack
          child: TextField(
            style: TextStyle(color: UIDataColors.midBlackColor),
            controller: _.search,
            onChanged: (value) {
              _.filterProducts(value);
              value == '' ? _.isChecked = false : _.isChecked = true;
            },
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: UIDataColors.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: UIDataColors.borderColor)),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              labelText: "Enter item name",
              labelStyle: TextStyle(color: UIDataColors.midBlackColor),
              suffixIcon: Icon(
                Icons.search,
                color: UIDataColors.midBlackColor,
              ),
            ),
          )),
    ).paddingOnly(bottom: 34);
  }
}

class StaticItemsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6), topRight: Radius.circular(6)),
          color: UIDataColors.blueColor),
      height: 50,
      // Static Categories
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: Get.width / 1.5 / 5,
            child: const Text(
              'Item Name',
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: Get.width / 1.5 / 5,
            child: const Text('Brand'),
          ),
          Container(
            alignment: Alignment.center,
            width: Get.width / 1.5 / 5,
            child: const Text('Selling Price'),
          ),
          Container(
            alignment: Alignment.center,
            width: Get.width / 1.5 / 5,
            child: const Text('Qty'),
          ),
          Container(
            alignment: Alignment.center,
            width: Get.width / 1.5 / 5,
            child: const Text('Sub Total'),
          )
        ],
      ),
    );
  }
}

class DynamicItemsContainer extends StatelessWidget {
  NewsaleController _;
  DynamicItemsContainer(this._);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: 600,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6)),
            color: UIDataColors.whiteColor),
        child: Obx(
          () => _.itemRows.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Your cart is empty",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: UIDataColors.errorColor),
                  ),
                )
              : ListView.builder(
                  itemCount: _.itemRows.length,
                  itemBuilder: (BuildContext context, index) {

                    _.subtotal.value = _.itemRows.value[index]['selling'];
                    return Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 1.5,
                                    color: UIDataColors.borderColor))),
                        height: 60,
                        child: Row(
                          children: [
                            // Name Container
                            Container(
                                alignment: Alignment.center,
                                width: Get.width / 1.5 / 5,
                                child: Row(
                                  children: [
                                    Text(
                                      _.itemRows.value[index]['name'],
                                      style: const TextStyle(
                                          color: UIDataColors.midBlackColor),
                                    ).paddingOnly(left: 60),
                                  ],
                                )),
                            // Dynamic brand Container
                            Container(
                              alignment: Alignment.center,
                              width: Get.width / 1.5 / 5,
                              child: Text(
                                _.itemRows.value[index]['brand'].toString(),
                                style: const TextStyle(
                                    color: UIDataColors.midBlackColor),
                              ),
                            ),
                            // Dynamic selling price Container
                            Container(
                              alignment: Alignment.center,
                              width: Get.width / 1.5 / 5,
                              child: Text(
                                _.itemRows.value[index]['selling'].toString(),
                                style: const TextStyle(
                                    color: UIDataColors.midBlackColor),
                              ),
                            ),
                            // Dynamic quantity Container
                            Container(
                              alignment: Alignment.center,
                              width: Get.width / 1.5 / 5,
                              child: SizedBox(
                                width: 80,
                                height: 35,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: _.itemRows.value[index]
                                      ['quantity'],
                                  onTap: () {
                                    _.outsideCheck.value = true;
                                    _.j = index;
                                    _.subtotal.value =
                                        _.itemRows.value[index]['selling'];
                                  },
                                  onTapOutside: (value) {
                                    if (_.outsideCheck.value) {
                                      _.itemRows.value[_.j]
                                          ['subTotal'] = int.parse(_.itemRows
                                              .value[_.j]['quantity'].text
                                              .toString()) *
                                          int.parse(_
                                              .itemRows.value[_.j]['selling']
                                              .toString());

                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      _.outsideCheck.value = false;
                                    }
                                  },
                                  onChanged: (value) {
                                    int v = int.tryParse(_.itemRows
                                            .value[_.j]['quantity'].text) ??
                                        0;
                                    _.itemRows.value[_.j]['subTotal'] = v *
                                        int.parse(_
                                            .itemRows.value[_.j]['selling']
                                            .toString());

                                    // FocusScope.of(context)
                                    //     .requestFocus(
                                    //         FocusNode());
                                    _.outsideCheck.value = false;
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
                            ),
                            // Dynamic Brand Container
                            SizedBox(
                              child: SizedBox(
                                  width: Get.width / 1.5 / 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: Get.width / 1.5 / 5 / 2,
                                        child: Obx(() => _.outsideCheck.value
                                            ? Text(
                                                _.itemRows
                                                    .value[index]['subTotal']
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor),
                                              ).paddingOnly(left: 50)
                                            : Text(
                                                _.itemRows
                                                    .value[index]['subTotal']
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: UIDataColors
                                                        .midBlackColor),
                                              ).paddingOnly(left: 50)),
                                      ),
                                      SizedBox(
                                        // width: 10,
                                        child: IconButton(
                                          icon: const Icon(Icons.delete,
                                              color: UIDataColors.errorColor),
                                          onPressed: () =>
                                              _.deleteProduct(index),
                                        ).paddingOnly(left: 30),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ));
                  }),
        ));
  }
}

class AbsoluteSearchContainer extends StatelessWidget {
  NewsaleController _;
  AbsoluteSearchContainer(this._);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xffE8EBEE)),
      width: Get.width / 1.5 / 1.1,
      height: 200,
      child: Obx(() => ListView.builder(
          itemCount: _.foundProducts.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                _.isChecked = false;
                _.search.text = '';
                _.addRow(
                  _.foundProducts.value[index]['id'],
                  _.foundProducts.value[index]['name'],
                  _.foundProducts.value[index]['brand'],
                  _.foundProducts.value[index]['selling'],
                );
                _.update();
              },
              child: Container(
                  // alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0, color: UIDataColors.borderColor)),
                  ),
                  height: 35,
                  child: Text(
                    _.foundProducts.value[index]['name'],
                    style: const TextStyle(color: UIDataColors.midBlackColor),
                  )).paddingOnly(top: 10, left: 10),
            );
          })),
    ).paddingSymmetric(horizontal: 43, vertical: 68);
  }
}

class AddCustomerButton extends StatelessWidget {
  const AddCustomerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // _.total.add(_.itemRows.value[index]['selling']);
          Get.toNamed(Routes.customer);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          color: UIDataColors.blueColor,
          child: const Text('Add Customer'),
        )).paddingAll(20);
  }
}

class DiscountButton extends StatelessWidget {
  NewsaleController _;
  DiscountButton(this._);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        _.isDiscount
            ? SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Discount Items by Percent:",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                          color: UIDataColors.midBlackColor),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _.isDiscount = false;
                        _.update();
                      },
                      child: const Text(
                        'Set Discount',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ).marginOnly(top: 25)
            // Absolute set Discount
            : Container(
                color: UIDataColors.whiteColor,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 140,
                      height: 30,
                      child: TextField(
                        style: TextStyle(color: UIDataColors.midBlackColor),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: UIDataColors.borderColor)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: UIDataColors.borderColor)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            labelText: "Set Discount",
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: UIDataColors.midBlackColor)),
                      ),
                    ).marginOnly(left: 20),
                    IconButton(
                        onPressed: () {
                          _.isDiscount = true;
                          _.update();
                        },
                        icon: const Icon(
                          Icons.done,
                          color: UIDataColors.blueColor,
                        ))
                  ],
                )).marginOnly(top: 15)
      ],
    );
  }
}

class CustomerPaidButton extends StatelessWidget {
  NewsaleController _;
  CustomerPaidButton(this._);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: Get.width / 4 / 2.1,
          height: 30,
          child: TextField(
              style: const TextStyle(color: UIDataColors.midBlackColor),
              controller: _.customerPaid,
              // onChanged: (value)=>_.customerReturn = value,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: UIDataColors.borderColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: UIDataColors.borderColor)),
                  hintText: "Customer Paid",
                  hintStyle: TextStyle(
                      color: UIDataColors.midBlackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w200))),
        ),
        ElevatedButton(
          onPressed: () {
            _.paid();
            _.customerPaid.clear();
          },
          child: const Text(
            'Paid',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ).paddingSymmetric(horizontal: 15),
        )
      ],
    )).paddingOnly(top: 40, bottom: 10);
  }
}

class CustomerName extends StatelessWidget {
  NewsaleController _;
  CustomerName(this._);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Customer Name:',
          style: TextStyle(
              fontSize: 16,
              color: UIDataColors.midBlackColor,
              fontWeight: FontWeight.w300),
        ),
        Text(_.customerDataClone,
            style: const TextStyle(
                fontSize: 16,
                color: UIDataColors.midBlackColor,
                fontWeight: FontWeight.w300)),
      ],
    ).paddingOnly(left: 25, top: 30, right: 25);
  }
}

class TotalBillButton extends StatelessWidget {
  NewsaleController _;
  TotalBillButton(this._);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              _.totalBillButton();
            },
            child: const Text(
              'Total Bill:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: UIDataColors.midBlackColor),
            ),
          ),
          Obx(
            () => Text(
              "Rs:${_.sum.value}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: UIDataColors.midBlackColor),
            ),
          ),
        ],
      ).paddingOnly(left: 25, right: 25, top: 30),
    );
  }
}

class ReturnAmount extends StatelessWidget {
  NewsaleController _;
  ReturnAmount(this._);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: _.isReturn
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Return:',
                  style: TextStyle(
                      color: UIDataColors.midBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  'Rs: ${_.customerReturn}',
                  style: const TextStyle(
                      color: UIDataColors.midBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ],
            )
          : null,
    ).paddingOnly(left: 25, top: 30, right: 25);
  }
}

class PrintButton extends StatelessWidget {
  NewsaleController _;
  PrintButton(this._);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(UIDataColors.errorColor)),
              onPressed: () {
                _.clearAll();
              },
              child: const Text('Clear All',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            ),
          ).paddingOnly(
            bottom: 10,
          ),
          SizedBox(
            width: Get.width,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                _.printsale();
              },
              child: const Text('Print',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            ),
          ).paddingOnly(bottom: 20)
        ],
      ).paddingOnly(left: 25, top: 30, right: 25),
    );
  }
}

class LeftSideContainer extends StatelessWidget {
  NewsaleController _;
  LeftSideContainer(this._);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Get.width / 1.5,
          child: Column(children: [
            // Search Container
            SearchBar(_),
            // Heading of items Container
            StaticItemsContainer(),
            // Dynamic Items Container
            DynamicItemsContainer(_),
          ]),
        ),
        // Absolute COntainer for search items
        _.isChecked ? AbsoluteSearchContainer(_) : const SizedBox(),
      ],
    );
  }
}

class RightSideContainer extends StatelessWidget {
  NewsaleController _;
  RightSideContainer(this._);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: UIDataColors.whiteColor),
      width: Get.width / 4,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add Customer Button
            const AddCustomerButton(),
            // Discount Button
            DiscountButton(_),
            //Customer Paid
            CustomerPaidButton(_),
            // Customer Name
            CustomerName(_),
            // Total Bill Button
            TotalBillButton(_),
            // Return Amount
            ReturnAmount(_),
            // Print and Cancel Button
            PrintButton(_),
          ]),
    );
  }
}
