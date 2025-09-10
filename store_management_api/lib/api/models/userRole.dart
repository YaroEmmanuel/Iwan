import 'dart:convert';

import 'package:store_management_api/api/models/basicModel.dart';
import 'package:store_management_api/api/models/role.dart';
import 'package:store_management_api/api/models/user.dart';

class UserRole extends BasicModel {
  int? _userRoleId;
  int? _userId;
  int? _roleId;
  User? _user;
  Role? _role;

  UserRole({int? userRoleId, int? userId, int? roleId, Role? role, User? user})
    : _userRoleId = userRoleId,
      _userId = userId,
      _roleId = roleId,
      _role = role,
      _user = user {
    super.id = userRoleId;
  }

  //Getters
  int? get userRoleId => _userId;
  int? get userId => _userId;
  int? get roleId => _roleId;
  Role? get role => _role;
  User? get user => _user;

  //Setters
  set userRoleId(int? value) {
    _userRoleId = value;
    super.id = _userRoleId;
  }

  set roleId(int? value) => _roleId = value;
  set userId(int? value) => _userId = value;
  set role(Role? value) => _role = value;
  set user(User? value) => _user = value;

  @override
  Map<String, dynamic> toJson() {
    return {
      'userRoleId': _userRoleId,
      'roleId': _roleId,
      'UserId': _userId,
      'role': _role,
      'user': _user,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      userRoleId: json['userRoleId'],
      userId: json['userId'],
      roleId: json['roleId'],
      role: json['role'] == null ? null : Role.fromJson(json['role']),
      user: json['user'] == null ? null : User.fromJson(json['user']),
    );
  }
}
