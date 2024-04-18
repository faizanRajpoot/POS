import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/controllers/expenseController/expenseController.dart';
import 'package:flutter_application_1/src/ui/widgets/commonScaffold.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/config/uidata.dart';

class AddExpense extends StatelessWidget {
  AddExpense({super.key});
 final ExpenseController _ = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: body(context),
      showDrawer: true,
    );
  }

  Widget body(BuildContext context) {
    return Structure(_);
  }
}

// Structure
class Structure extends StatelessWidget {
  ExpenseController _;
  Structure(this._);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width,
        height: Get.height / 2,
        color: UIDataColors.whiteColor,
        child: SizedBox(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // DateField
                    DateField(_),
                    // ReferenceField
                    ReferenceField(_)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //  NameField
                    NameField(_),
                    // AmountField
                    AmountField(_),
                  ],
                ),
                // Buttons
                Buttons(_)
              ]),
        ).paddingSymmetric(horizontal: 40),
      ).paddingSymmetric(horizontal: 60, vertical: 60),
    );
  }
}

// DateField
class DateField extends StatelessWidget {
  ExpenseController _;
  DateField(this._);

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
          controller: _.dateinput,
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

              _.dateinput.text = formattedDate;
            } else {
              print("Date is not selected");
            }
          },
        ));
  }
}

// ReferenceField
class ReferenceField extends StatelessWidget {
  ExpenseController _;
  ReferenceField(this._);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 3,
      height: 50,
      child: TextFormField(
          style: TextStyle(color: UIDataColors.midBlackColor),
          // onChanged: (value) => _.nameCheck.value = true,
          controller: _.referenceField,
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

// NameField
class NameField extends StatelessWidget {
  ExpenseController _;
  NameField(this._);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 3,
      height: 50,
      child: TextFormField(
          style: TextStyle(color: UIDataColors.midBlackColor),
          // onChanged: (value) => _.nameCheck.value = true,
          controller: _.nameField,
          onFieldSubmitted: (__) {
            // _.updateCheck.value ? _.Update2(i) : _.Update();
            // _.cs.fetchedItems();
          },
          decoration: const InputDecoration(
              labelText: "Name",
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

// AmountField
class AmountField extends StatelessWidget {
  ExpenseController _;
  AmountField(this._);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 3,
      height: 50,
      child: TextFormField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          style: TextStyle(color: UIDataColors.midBlackColor),
          // onChanged: (value) => _.nameCheck.value = true,
          controller: _.amountField,
          onFieldSubmitted: (__) {
            // _.updateCheck.value ? _.Update2(i) : _.Update();
            // _.cs.fetchedItems();
          },
          decoration: const InputDecoration(
              labelText: "Enter Amount",
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

// Buttons
class Buttons extends StatelessWidget {
  ExpenseController _;
  Buttons(this._);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              Get.back();
              _.appbarController.title.value = 'List Expense';
              _.Cancel();
              Get.offAndToNamed(Routes.listexpense);
            },
            child: const Text('Cancel')),
        ElevatedButton(
            onPressed: () {
              _.addExpense();
            },
            child: const Text('Add Expense'))
      ],
    );
  }
}
