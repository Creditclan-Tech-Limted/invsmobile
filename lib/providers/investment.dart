import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:selcapital/httpClient.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/providers/user.dart';

class InvestmentModel extends ChangeNotifier {
  UserModel _userModel = new UserModel();

  final Map _investment = new Map();
  final http.BaseClient httpClient = new HttpClient(kApiKey, http.Client());

  UnmodifiableMapView get investment => UnmodifiableMapView(_investment);

  List<dynamic> get investmentsList => _investment['investments'];

  void update(UserModel userModel) {
    _userModel = userModel;

    notifyListeners();
  }

  Future<bool> save(String amount, String duration) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/investment/create',
        body: jsonEncode(<String, dynamic>{
          'token': _userModel.user?.token,
          'plan': {
            'amount': amount,
            'duration': duration,
            'funding_source': '1',
            'category': '2823',
          },
          'card': {
            'connected_card_id': '86640',
          },
          'paystack': {
            'reference': '',
          },
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

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
}
