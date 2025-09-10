import 'dart:convert';

import 'package:store_management_api/api/models/basicModel.dart';
import 'package:store_management_api/api/models/permission.dart';
import 'package:store_management_api/api/models/role.dart';

class RolePermission extends BasicModel {
  int? _rolePermissionId;
  int? _roleId;
  int? _permissionId;
  Role? _role;
  Permission? _permission;

  RolePermission({
    int? rolePermissionId,
    int? roleId,
    int? permissionId,
    Role? role,
    Permission? permission,
  }) : _rolePermissionId = rolePermissionId,
       _roleId = roleId,
       _permissionId = permissionId,
       _role = role,
       _permission = permission {
    super.id = _rolePermissionId;
  }

  //Getters
  int? get rolePermissionId => _rolePermissionId;
  int? get roleId => _roleId;
  int? get permissionId => _permissionId;
  Role? get role => _role;
  Permission? get permission => _permission;

  //Setters

  set rolePermissionId(int? value) {
    _rolePermissionId = value;
    super.id = _rolePermissionId;
  }

  set roleId(int? value) => _roleId = value;

  set permissionId(int? value) => _permissionId = value;

  set role(Role? value) => _role = value;

  set permission(Permission? value) => _permission = value;

  @override
  Map<String, dynamic> toJson() {
    return {
      'rolePermissionId': _rolePermissionId,
      'roleId': _roleId,
      'permissionId': _permissionId,
      'role': _role?.toJson(),
      'permission': _permission?.toJson(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory RolePermission.fromJson(Map<String, dynamic> json) {
    return RolePermission(
      rolePermissionId: json['rolePermissionId'],
      roleId: json['roleId'],
      permissionId: json['permissionId'],
      role: json['role'] == null ? null : Role.fromJson(json['role']),
      permission: json['permission'] == null
          ? null
          : Permission.fromJson(json['permission']),
    );
  }
}
