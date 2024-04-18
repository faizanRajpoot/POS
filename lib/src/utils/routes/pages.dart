// ignore_for_file: constant_identifier_names
import 'package:flutter_application_1/src/bindings/inventorybinding/inventoryadditembinding.dart';
import 'package:flutter_application_1/src/bindings/inventorybinding/inventorybindings.dart';
import 'package:flutter_application_1/src/bindings/inventorybinding/inventorylistbinding.dart';
import 'package:flutter_application_1/src/bindings/loginbinding/loginbinding.dart';
import 'package:flutter_application_1/src/bindings/newsalebinding/newsalebinding.dart';
import 'package:flutter_application_1/src/middlewares/auth.dart';
import 'package:flutter_application_1/src/ui/views/customers/customer.dart';
import 'package:flutter_application_1/src/ui/views/dashboardScreen/dashboard.dart';
import 'package:flutter_application_1/src/ui/views/inventoryScreens/inventory.dart';
import 'package:flutter_application_1/src/ui/views/inventoryScreens/inventoryAddItem.dart';
import 'package:flutter_application_1/src/ui/views/inventoryScreens/inventoryList.dart';
import 'package:flutter_application_1/src/ui/views/loginScreen/login.dart';
import 'package:flutter_application_1/src/ui/views/newsaleScreen/newsale.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/route_manager.dart';

import '../../bindings/categorybinding/categorybinding.dart';
import '../../bindings/customerbinding/customerbinding.dart';
import '../../bindings/expensebinding/expensebinding.dart';
import '../../bindings/purchasebinding/purchasebinding.dart';
import '../../bindings/supplierbinding/supplierbinding.dart';
import '../../ui/views/categories/category.dart';
import '../../ui/views/expense/addexpense.dart';
import '../../ui/views/expense/listexpense.dart';
import '../../ui/views/newsaleScreen/salesrecord.dart';
import '../../ui/views/purchase/addpurchase.dart';
import '../../ui/views/purchase/listpurchase.dart';
import '../../ui/views/supplier/supplier.dart';

class AppPages {
  static const INITIAL = Routes.dashboard;

  static final routes = [
    GetPage(
        name: Routes.loginroute,
        binding: LoginBinding(),
        page: () => LoginPage()),
    GetPage(
      name: Routes.dashboard,
      middlewares: [AuthMiddleware()],
      page: () => Dashboard(),
    ),
    GetPage(
      name: Routes.inventory,
      binding: InventorydBinding(),
      page: () => Inventory(),
    ),
    GetPage(
      name: Routes.inventoryList,
      binding: InventoryListBinding(),
      page: () => const InventoryList(),
    ),
    GetPage(
      name: Routes.inventoryAddItem,
      binding: InventoryAddItemBinding(),
      page: () => const AddItem(),
    ),
    GetPage(
      name: Routes.newSale,
      binding: NewsaleBinding(),
      page: () => Newsale(),
    ),
    GetPage(
      name: Routes.customer,
      binding: CustomerBinding(),
      page: () => Customer(),
    ),
    GetPage(
      name: Routes.salesrecord,
      binding: NewsaleBinding(),
      page: () => Salesrecord(),
    ),
    GetPage(
      name: Routes.category,
      binding: CategoryBinding(),
      page: () => Categ(),
    ),
    GetPage(
      name: Routes.supplier,
      binding: SupplierBinding(),
      page: () => Supplier(),
    ),
    GetPage(
      name: Routes.listpurchase,
      binding: PurchaseBinding(),
      page: () => ListPurchase(),
    ),
     GetPage(
      name: Routes.addpurchase,
      binding: PurchaseBinding(),
      page: () => AddPurchase(),
    ),

      GetPage(
      name: Routes.addexpense,
      binding: ExpenseBinding(),
      page: () => AddExpense(),
    ),

    GetPage(
      name: Routes.listexpense,
      binding: ExpenseBinding(),
      page: () => ListExpense(),
    ),
  ];
}
