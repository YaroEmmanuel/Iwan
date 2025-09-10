import 'dart:convert';

import 'package:store_management_api/api/models/basicModel.dart';
import 'package:store_management_api/api/models/role.dart';

class User extends BasicModel {
  int? _userId;
  int? _roleId;
  Role? _role;
  String _username;
  String _firstname;
  String _lastname;
  String _phone;
  String _password;
  bool _enabled;

  User({
    required bool enabled,
    required String firstname,
    required String lastname,
    required String phone,
    required String password,
    required String username,
    int? userId,
    int? roleId,
    Role? role,
  }) : _userId = userId,
       _roleId = roleId,
       _role = role,
       _username = username,
       _enabled = enabled,
       _firstname = firstname,
       _lastname = lastname,
       _password = password,
       _phone = phone {
    super.id = userId;
  }

  // Getters
  int? get userId => _userId;
  int? get roleId => _roleId;
  Role? get role => _role;
  String get username => _username;
  String get firstname => _firstname;
  String get lastname => _lastname;
  String get phone => _phone;
  String get password => _password;
  bool get enabled => _enabled;

  // Setters
  set userId(int? value) {
    _userId = value;
    super.id = userId;
  }

  set roleId(int? value) => _userId = value;

  set role(Role? value) => _role = value;

  set username(String value) => _username = value;
  set firstname(String value) => _firstname = value;
  set lastname(String value) => _lastname = value;
  set phone(String value) => _phone = value;
  set password(String value) => _password = value;
  set enabled(bool value) => _enabled = value;

  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': _userId,
      'roleId': _roleId,
      'role': _role?.toJson(),
      'username': _username,
      'firstname': _firstname,
      'lastname': _lastname,
      'phone': _phone,
      'password': _password,
      'enabled': _enabled,
    };
  }

  @override
  String toString() {
    return json.encode(toJson());
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      roleId: json['roleId'],
      role: json['role'] == null ? null : Role.fromJson(json['role']),
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phone: json['phone'],
      password: json['password'],
      enabled: json['enabled'] ?? false,
    );
  }
}
