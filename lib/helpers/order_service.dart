import 'dart:convert';

import 'package:dc_app/helpers/strings.dart';
import 'package:dc_app/models/order.dart';
import 'package:http/http.dart' as http;

Future<List<Order>> getAllOrder() async {
  var res = await http.get(
    Uri.parse("$baseUrl$orderUrl$getAllUrl"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (res.statusCode == 200) {
    List jsonData = json.decode(utf8.decode(res.bodyBytes));
    return jsonData.map((e) => new Order.fromMap(e)).toList();
  } else
    throw Exception("No data !!!");
}

//Get orders data by employee id
Future<List<Order>> getOrderByEmpId(int empId) async {
  var res = await http.get(
    Uri.parse("$baseUrl$orderUrl$getUrl$empId"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (res.statusCode == 200) {
    List jsonData = json.decode(utf8.decode(res.bodyBytes));

    print(jsonData);
    return jsonData.map((e) => new Order.fromMap(e)).toList();
  } else
    throw Exception("No data !!!");
}
