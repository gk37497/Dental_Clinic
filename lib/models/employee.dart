import 'dart:convert';

import 'hospital.dart';
import 'role.dart';

class Employee {
  int employeeId;
  String username;
  String password;
  DateTime birthDate;
  String firstName;
  String lastName;
  int phoneNumber;
  Hospital hospital;
  List<Role> empRoles;

  Employee({
    required this.employeeId,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.hospital,
    required this.empRoles,
  });

  Map<String, dynamic> toMap() {
    return {
      'employeeId': employeeId,
      'username': username,
      'password': password,
      'birthDate': birthDate.toIso8601String(),
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'hospital': hospital.toMap(),
      'empRoles': empRoles.map((x) => x.toMap()).toList(),
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      employeeId: map['employeeId'],
      username: map['username'],
      password: map['password'],
      birthDate: DateTime.parse(map['birthDate']),
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      hospital: Hospital.fromMap(map['hospital']),
      empRoles: List<Role>.from(map['empRoles']?.map((x) => Role.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source));
}
