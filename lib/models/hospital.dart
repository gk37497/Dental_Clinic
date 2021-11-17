import 'dart:convert';

class Hospital {
  int hospitalId;
  String hospitalName;

  Hospital({
    required this.hospitalId,
    required this.hospitalName,
  });

  Map<String, dynamic> toMap() {
    return {
      'hospitalId': hospitalId,
      'hospitalName': hospitalName,
    };
  }

  factory Hospital.fromMap(Map<String, dynamic> map) {
    return Hospital(
      hospitalId: map['hospitalId'],
      hospitalName: map['hospitalName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Hospital.fromJson(String source) =>
      Hospital.fromMap(json.decode(source));
}
