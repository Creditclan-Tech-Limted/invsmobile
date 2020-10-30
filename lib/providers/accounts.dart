import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:selcapital/httpClient.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/providers/user.dart';

class Accounts {
  String bvn;
  String txn;
  List<dynamic> cards;
  List<dynamic> banks;
  final String firstName;
  final String lastName;
  final String dob;
  final String phone;

  Accounts({
    this.bvn,
    this.txn,
    this.cards,
    this.banks,
    this.firstName,
    this.lastName,
    this.dob,
    this.phone,
  });

  factory Accounts.fromJson(Map<String, dynamic> json) {
    return Accounts(
      bvn: json['data']['data']['bvn'],
      txn: json['data']['TXN_REF'],
      cards: json['cards'],
      banks: json['banks'],
      firstName: json['data']['data']['first_name'],
      lastName: json['data']['data']['last_name'],
      dob: json['data']['data']['formatted_dob'],
      phone: json['data']['data']['mobile'],
    );
  }
}

class AccountsModel extends ChangeNotifier {
  final http.BaseClient httpClient = new HttpClient(kApiKey, http.Client());

  UserModel _userModel = new UserModel();
  Accounts _accounts = new Accounts();

  Accounts get accounts => _accounts;

  String get bvn => _accounts.bvn;

  List<dynamic> get cards => _accounts.cards;

  List<dynamic> get banks => _accounts.banks;

  void update(UserModel userModel) {
    _userModel = userModel;

    notifyListeners();
  }

  Future<bool> sendBvn(String bvn) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/validate_customer_bvn',
        body: jsonEncode(<String, String>{
          'bvn': bvn,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        bool checkValid = jsonDecode(response.body)['status'];
        if (!checkValid) throw Exception(response.body);
        _accounts = Accounts.fromJson(jsonDecode(response.body));

        notifyListeners();

        return true;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');

      notifyListeners();

      return false;
    }
  }

  Future<bool> validateBvn(String otp, String txn) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/validate_customer_bvn_otp',
        body: jsonEncode(<String, String>{
          'otp': otp,
          'txn': txn,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        bool checkValid = jsonDecode(response.body)['status'];
        if (!checkValid) throw Exception(response.body);

        notifyListeners();

        return true;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');

      notifyListeners();

      return false;
    }
  }

  Future<void> addCard() async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/add/newcard',
        body: jsonEncode(<String, String>{
          'token': _userModel.user.token,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> fetchCards() async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/cards',
        body: jsonEncode(<String, String>{
          'token': _userModel.user.token,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _accounts.cards = Accounts.fromJson(jsonDecode(response.body)).cards;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> resolveBank(String account, String bank) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/user/account/resolve',
        body: jsonEncode(<String, String>{
          'token': _userModel.user.token,
          'account_number': account,
          'bank_code': bank,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> addBank(String name, String account, String bank) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/user/account/save',
        body: jsonEncode(<String, String>{
          'token': _userModel.user.token,
          'account_name': name,
          'account_number': account,
          'bank_code': bank,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        bool checkValid = jsonDecode(response.body)['status'];
        if (!checkValid) throw Exception(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> fetchBanks() async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/accounts',
        body: jsonEncode(<String, String>{
          'token': _userModel.user.token,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _accounts.banks = Accounts.fromJson(jsonDecode(response.body)).banks;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }
}
