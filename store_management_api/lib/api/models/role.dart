import 'dart:convert';

import 'package:store_management_api/api/models/basicModel.dart';

class Role extends BasicModel {
  int? _roleId;
  String _title;

  Role({required String title, int? roleId})
    : _title = title,
      _roleId = roleId {
    super.id = roleId;
  }

  //Getters
  int? get roleId => _roleId;
  String get title => _title;

  //Setters
  set roleId(int? value) {
    _roleId = value;
    super.id = _roleId;
  }

  set title(String value) => _title = value;

  @override
  Map<String, dynamic> toJson() {
    return {'roleId': _roleId, 'title': _title};
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(roleId: json['roleId'], title: json['title']);
  }
}
