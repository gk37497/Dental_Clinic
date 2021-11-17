import 'dart:convert';

class OrderType {
  int tId;
  String typeName;
  int duration;
  OrderType({
    required this.tId,
    required this.typeName,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'tId': tId,
      'typeName': typeName,
      'duration': duration,
    };
  }

  factory OrderType.fromMap(Map<String, dynamic> map) {
    return OrderType(
      tId: map['type_id'],
      typeName: map['type_name'],
      duration: map['duration'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderType.fromJson(String source) =>
      OrderType.fromMap(json.decode(source));
}
