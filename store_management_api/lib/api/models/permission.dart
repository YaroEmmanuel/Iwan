import 'dart:convert';

import 'package:store_management_api/api/models/action.dart';
import 'package:store_management_api/api/models/basicModel.dart';

class Permission extends BasicModel {
  int? _permissionId;
  String _label;
  List<Action> _actions;

  Permission({required String label, int? permissionId, List<Action>? actions})
    : _permissionId = permissionId,
      _label = label,
      _actions = actions ?? [] {
    super.id = permissionId;
  }

  //Getters

  int? get permissionId => _permissionId;
  String get label => _label;
  List<Action> get actions => _actions;

  //Setters
  set permissionId(int? value) {
    _permissionId = value;
    super.id = _permissionId;
  }

  set label(String value) => _label = value;
  set actions(List<Action> values) => _actions = values;

  set addAction(Action value) {
    var actions = [..._actions];
    actions.add(value);
    actions = actions.toSet().toList();
    _actions = actions;
  }

  set removeAction(Action value) {
    _actions.remove(value);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'label': _label, 'id': _permissionId, 'actions': _actions};
  }

  @override
  String toString() {
    return json.encode(toJson());
  }

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      label: json['label'],
      permissionId: json['permissionId'],
      actions: json['actions'] == null
          ? null
          : (json['actions'] as List)
                .map((value) => Action.fromString(value))
                .toList(),
    );
  }
}
