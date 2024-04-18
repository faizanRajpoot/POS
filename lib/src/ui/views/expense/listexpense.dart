import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/expenseController/expenseController.dart';
import 'package:flutter_application_1/src/ui/widgets/commonScaffold.dart';
import 'package:get/get.dart';

import '../../../utils/config/uidata.dart';
import '../../../utils/routes/routes.dart';

class ListExpense extends StatelessWidget {
  ListExpense({super.key});
  final ExpenseController _ = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: body(),
      showDrawer: true,
    );
  }

  Widget body() {
    // Structure
    return Structure(_);
  }
}

//Structure
class Structure extends StatelessWidget {
  ExpenseController _;
  Structure(this._);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Add Expense button
          AddExpenseButton(_),
          Container(
              color: Colors.white,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Static Expense Container
                  StaticExpenseContainer(_),
                  // Dynamic Expense Container
                  DynamicExpenseContainer(_)
                ],
              )).marginSymmetric(horizontal: 50, vertical: 40)
        ],
      ),
    );
  }
}

// Add Expense Button
class AddExpenseButton extends StatelessWidget {
  ExpenseController _;
  AddExpenseButton(this._);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width / 6,
        height: 60,
        color: UIDataColors.blueColor,
        child: TextButton(
          onPressed: () {
            _.appbarController.title.value = 'Add Expense';
            Get.toNamed(Routes.addexpense);
          },
          child: const Text(
            'Add Expense',
            style: TextStyle(
                color: UIDataColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w300),
          ),
        )).paddingOnly(right: 60, top: 40);
  }
}

// Static Expense Container
class StaticExpenseContainer extends StatelessWidget {
  ExpenseController _;
  StaticExpenseContainer(this._);

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
                  'Refrence',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Created by',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Amount',
                  style: TextStyle(color: UIDataColors.midBlackColor),
                ),
                Text(
                  'Action',
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

// Dynamic Expense Container
class DynamicExpenseContainer extends StatelessWidget {
  ExpenseController _;
  DynamicExpenseContainer(this._);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 600,
      child: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            itemCount: _.expense.length,
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
                            child: Text('${_.expense[index]['date']}',
                                style: const TextStyle(
                                    color: UIDataColors.midBlackColor)),
                          ),
                          Expanded(
                            child: Text('${_.expense[index]['reference']}',
                                    style: const TextStyle(
                                        color: UIDataColors.midBlackColor))
                                .paddingOnly(left: 10),
                          ),
                          Expanded(
                            child: Text('${_.expense[index]['name']}',
                                    style: const TextStyle(
                                        color: UIDataColors.midBlackColor))
                                .paddingOnly(left: 30),
                          ),
                          Expanded(
                            child: Text('${_.expense[index]['amount']}',
                                    style: const TextStyle(
                                        color: UIDataColors.midBlackColor))
                                .paddingOnly(left: 50),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: UIDataColors.blueColor,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    _.Delete(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: UIDataColors.errorColor,
                                  ))
                            ],
                            // ),
                          ),
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
