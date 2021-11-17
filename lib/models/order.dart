import 'dart:convert';

import 'employee.dart';
import 'type.dart';

class Order {
  int orderId;
  String consumerName;
  String consumerAddress;
  int consumerPhoneNumber;
  DateTime startDate;
  DateTime endDate;
  int isDone;
  Employee dentist;
  OrderType orderType;

  Order({
    required this.orderId,
    required this.consumerName,
    required this.consumerAddress,
    required this.consumerPhoneNumber,
    required this.startDate,
    required this.endDate,
    required this.isDone,
    required this.dentist,
    required this.orderType,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'consumerName': consumerName,
      'consumerAddress': consumerAddress,
      'consumerPhoneNumber': consumerPhoneNumber,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'isDone': isDone,
      'dentist': dentist.toMap(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
        orderId: map['orderId'],
        consumerName: map['consumerName'],
        consumerAddress: map['consumerAddress'],
        consumerPhoneNumber: map['consumerPhoneNumber'],
        startDate: DateTime.parse(map['startDate']),
        endDate: DateTime.parse(map['endDate']),
        isDone: map['isDone'],
        dentist: Employee.fromMap(map['employee']),
        orderType: OrderType.fromMap(map['orderType']));
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
