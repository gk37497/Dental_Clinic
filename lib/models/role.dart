import 'dart:convert';

class Role {
  int roleId;
  String roleName;
  String roleCode;

  Role({
    required this.roleId,
    required this.roleName,
    required this.roleCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'roleId': roleId,
      'roleName': roleName,
      'roleCode': roleCode,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      roleId: map['roleId'],
      roleName: map['roleName'],
      roleCode: map['roleCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) => Role.fromMap(json.decode(source));
}
