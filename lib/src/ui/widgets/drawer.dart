// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/services/customer.dart';
import 'package:flutter_application_1/src/utils/config/uidata.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controllers/appbarController/appbarcontroller.dart';
import '../../utils/routes/routes.dart';

class MyDrawer extends StatelessWidget {
  final AppbarController appbarController = Get.put(AppbarController());
  final CustomerService customerService = Get.put(CustomerService());

  MyDrawer(
      {super.key, required Color backgroundColor, required ListView child});

  @override
  Widget build(BuildContext context) {
    return 
    Drawer(
      backgroundColor: const Color(0xff373942),
      // backgroundColor: UIDataColors.midBlackColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 64,
            child: InkWell(
              onTap: () {
                appbarController.title.value = 'Dashboard';
                Get.toNamed(Routes.dashboard);
              },
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: UIDataColors.blueColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'POS',
                    style:
                        TextStyle(fontSize: 30, color: UIDataColors.whiteColor),
                  ),
                ),
              ),
            ),
           ),
          ListTile(
            hoverColor: Color(0xff202126),
            leading: Icon(
              Icons.speed_sharp,
              color: UIDataColors.whiteColor,
              size: 18,
            ),
            title: const Text(
              "Dashboard",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onTap: () {
              // customerService.customerService();
              appbarController.changeTitle('Dashboard');
              Get.toNamed(Routes.dashboard);
            },
          ),
        
          ListTile(
            hoverColor: Color(0xff202126),
            leading: Icon(
              Icons.inbox,
              color: UIDataColors.whiteColor,
              size: 18,
            ),
            title: const Text(
              "Inventory",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onTap: () {
              appbarController.changeTitle('Inventory');
              Get.toNamed(Routes.inventory);
            },
          ),
          ListTile(
            hoverColor: Color(0xff202126),
            leading: Icon(
              Icons.contacts,
              color: UIDataColors.whiteColor,
              size: 18,
            ),
            title: const Text(
              "Customers",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onTap: () {
              appbarController.title.value = 'Customers';
              Get.toNamed(Routes.customer);
            },
          ),
          ListTile(
            hoverColor: Color(0xff202126),
            leading: Icon(
              Icons.graphic_eq,
              color: UIDataColors.whiteColor,
              size: 18,
            ),
            title: const Text(
              "Reports",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onTap: () {},
          ),
          ListTile(
            hoverColor: Color(0xff202126),
            leading: Icon(
              Icons.shopping_cart,
              color: UIDataColors.whiteColor,
              size: 18,
            ),
            title: const Text(
              "Sales",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onTap: () {
              appbarController.title.value = 'Sales Record';
              Get.toNamed(Routes.salesrecord);
            },
          ),
          ListTile(
            hoverColor: Color(0xff202126),
            leading: Icon(
              Icons.store_mall_directory,
              color: UIDataColors.whiteColor,
              size: 18,
            ),
            title: const Text(
              "Supplier",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onTap: () {
              appbarController.changeTitle('Supplier');
              Get.toNamed(Routes.supplier);
            },
          ),
          ListTile(
            hoverColor: Color(0xff202126),
            leading: Icon(
              Icons.offline_pin,
              color: UIDataColors.whiteColor,
              size: 18,
            ),
            title: const Text(
              "Purchase",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onTap: () {
              appbarController.changeTitle('List Purchase');
              Get.toNamed(Routes.listpurchase);
            },
          ),
          ListTile(
            hoverColor: Color(0xff202126),
            leading: Icon(
              Icons.account_balance_wallet,
              color: UIDataColors.whiteColor,
              size: 18,
            ),
            title: const Text(
              "Expense",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onTap: () {
              appbarController.changeTitle('List Expense');
              Get.toNamed(Routes.listexpense);
            },
          ),
          ListTile(
            hoverColor: Color(0xff202126),
            leading: Icon(
              Icons.logout_outlined,
              color: UIDataColors.whiteColor,
              size: 18,
            ),
            title: const Text(
              "Log Out",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
            onTap: () {
              GetStorage box = GetStorage();
              box.remove('login');
              Get.toNamed(Routes.loginroute);
            },
          ),
        ],
      ),
    );
  }
}
