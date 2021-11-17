import 'package:dc_app/helpers/order_service.dart';
import 'package:dc_app/models/order.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<Order> allOrders = [];
  List<Order> orders = [];

  bool loading = false;

  getOrdersData() async {
    loading = true;
    allOrders = await getAllOrder();
    print(allOrders[0].consumerName.characters);
    loading = false;
    notifyListeners();
  }

  getOrdersDataByEmpId(int empId) async {
    loading = true;
    orders = await getOrderByEmpId(empId);
    loading = false;
    notifyListeners();
  }
}
