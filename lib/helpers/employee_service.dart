import 'dart:convert';

import 'package:dc_app/models/employee.dart';
import 'package:http/http.dart' as http;

import 'strings.dart';

Future<Employee?> loginUser(String username, String password) async {
  var res = await http.post(
    Uri.parse("$baseUrl$employeeUrl$loginUrl"),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(
      {'username': username, 'password': password},
    ),
  );

  if (res.statusCode == 200 && res.contentLength != 0) {
    return Employee.fromJson(res.body);
  } else
    return null;
}
