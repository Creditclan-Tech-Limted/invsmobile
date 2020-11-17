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
  final String firstName;
  final String lastName;
  final String dob;
  final String phone;

  Accounts({
    this.bvn,
    this.txn,
    this.firstName,
    this.lastName,
    this.dob,
    this.phone,
  });

  factory Accounts.fromJson(Map<String, dynamic> json) {
    return Accounts(
      bvn: json['data']['data']['bvn'],
      txn: json['data']['TXN_REF'],
      firstName: json['data']['data']['first_name'],
      lastName: json['data']['data']['last_name'],
      dob: json['data']['data']['formatted_dob'],
      phone: json['data']['data']['mobile'],
    );
  }
}

class AccountHolder {
  String name;
  String account;
  String bank;

  AccountHolder({this.name, this.account, this.bank});

  factory AccountHolder.fromJson(Map<String, dynamic> json) {
    return AccountHolder(
      name: json['data']['account_name'],
      account: json['data']['account_number'],
      bank: '${json['data']['bank_id']}',
    );
  }
}

class Cards {
  final List<dynamic> data;

  Cards({this.data});

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
      data: json['data'],
    );
  }
}

class Banks {
  final List<dynamic> data;
  final List<dynamic> banks;

  Banks({this.data, this.banks});

  factory Banks.fromJson(Map<String, dynamic> json) {
    return Banks(
      data: json['data'],
      banks: json['banks_list'],
    );
  }
}

class AccountsModel extends ChangeNotifier {
  final http.BaseClient httpClient = new HttpClient(kApiKey, http.Client());

  UserModel _userModel = new UserModel();

  Accounts _accounts = new Accounts();
  AccountHolder _accountHolder = new AccountHolder();

  List<dynamic> _cards = [];
  List<dynamic> _banks = [];
  List<dynamic> _banksList = [];

  Accounts get accounts => _accounts;
  AccountHolder get accountHolder => _accountHolder;

  String get bvn => _accounts.bvn;

  List<dynamic> get cards => _cards;
  List<dynamic> get banks => _banks;
  List<dynamic> get banksList => _banksList;

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
        _cards = Cards.fromJson(jsonDecode(response.body)).data;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<bool> resolveBank(String account, String bank) async {
    try {
      print(account);
      print(bank);
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

        String checkValid = jsonDecode(response.body)['status'];
        if (checkValid != 'success') throw Exception(response.body);

        _accountHolder = AccountHolder.fromJson(jsonDecode(response.body));

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

  Future<bool> addBank(String name, String account, String bank) async {
    print(name);
    print(account);
    print(bank);
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/banks/save',
        body: jsonEncode(<String, String>{
          'token': _userModel.user.token,
          'account_name': name,
          'account_number': account,
          'bank_id': bank,
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
        _banks = Banks.fromJson(jsonDecode(response.body)).data;
        _banksList = Banks.fromJson(jsonDecode(response.body)).banks;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }
}
