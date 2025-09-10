import 'dart:convert';
import 'dart:core';

import 'package:store_management_api/api/models/basicModel.dart';
import 'package:store_management_api/api/models/paymentMethod.dart';
import 'package:store_management_api/api/models/status.dart';
import 'package:store_management_api/api/models/user.dart';

class Sale extends BasicModel {
  int? _saleId;
  int? _userId;
  User? _user;
  String _ticketNumber;
  DateTime _saleDate;
  PaymentMethod _paymentMethod;
  Status _status;

  Sale({
    int? saleId,
    int? userId,
    User? user,
    required String ticketNumber,
    required DateTime saleDate,
    required PaymentMethod paymentMethod,
    required Status status,
  }) : _saleId = saleId,
       _user = user,
       _ticketNumber = ticketNumber,
       _saleDate = saleDate,
       _paymentMethod = paymentMethod,
       _status = status {
    super.id = _saleId;
  }

  //Getters
  int? get saleId => _saleId;
  int? get userId => _userId;
  User? get user => _user;
  String get ticketNumber => _ticketNumber;
  DateTime get saleDate => _saleDate;
  PaymentMethod get paymentMethod => _paymentMethod;
  Status get status => _status;

  //Setters
  set saleId(int? value) {
    _saleId = value;
    super.id = _saleId;
  }

  set userId(int? value) => _userId = value;
  set user(User? value) => _user = value;
  set ticketNumber(String value) => _ticketNumber = value;
  set saleDate(DateTime value) => _saleDate = value;
  set paymentMethod(PaymentMethod value) => _paymentMethod = value;
  set status(Status value) => _status = value;

  @override
  Map<String, dynamic> toJson() {
    return {
      'saleId': _saleId,
      'userId': _userId,
      'user': _user?.toJson(),
      'ticketNumber': _ticketNumber,
      'saleDate': _saleDate,
      'paymentMethod': _paymentMethod,
      'status': _status,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory Sale.fromJson(Map<String, dynamic> json) {
    return Sale(
      saleId: json['saleId'],
      userId: json['userId'],
      user: json['user'] == null ? null : User.fromJson(json['user']),
      ticketNumber: json['ticketNumber'],
      saleDate: json['saleDate'],
      paymentMethod: json['paymentMethod'],
      status: json['status'],
    );
  }
}
