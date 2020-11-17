import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:selcapital/httpClient.dart';
import 'package:selcapital/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Option {
  final List<dynamic> data;

  Option({this.data});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      data: json['data'],
    );
  }
}

class OptionsModel extends ChangeNotifier {
  final http.BaseClient httpClient = new HttpClient(kApiKey, http.Client());

  List<dynamic> _gender = [];
  List<dynamic> _maritalStatus = [];
  List<dynamic> _educationSectors = [];
  List<dynamic> _occupations = [];
  List<dynamic> _workSectors = [];
  List<dynamic> _residenceTypes = [];
  List<dynamic> _states = [];
  List<dynamic> _lgas = [];
  List<dynamic> _banks = [];

  List<dynamic> get gender => _gender;
  List<dynamic> get maritalStatus => _maritalStatus;
  List<dynamic> get educationSectors => _educationSectors;
  List<dynamic> get occupations => _occupations;
  List<dynamic> get workSectors => _workSectors;
  List<dynamic> get residenceTypes => _residenceTypes;
  List<dynamic> get states => _states;
  List<dynamic> get lgas => _lgas;
  List<dynamic> get banks => _banks;

  Future<void> loadOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _gender = Option.fromJson(jsonDecode(prefs.getString('gender'))).data;
    _maritalStatus =
        Option.fromJson(jsonDecode(prefs.getString('maritalStatus'))).data;
    _educationSectors =
        Option.fromJson(jsonDecode(prefs.getString('educationSectors'))).data;
    _occupations =
        Option.fromJson(jsonDecode(prefs.getString('occupations'))).data;
    _workSectors =
        Option.fromJson(jsonDecode(prefs.getString('workSectors'))).data;
    _residenceTypes =
        Option.fromJson(jsonDecode(prefs.getString('residenceTypes'))).data;
    _states = Option.fromJson(jsonDecode(prefs.getString('states'))).data;
    _banks = Option.fromJson(jsonDecode(prefs.getString('banks'))).data;

    notifyListeners();
  }

  Future<void> fetchGenders() async {
    try {
      final response = await httpClient.get('$kBaseUrlv1/genders');
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _gender = Option.fromJson(jsonDecode(response.body)).data;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('gender', response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> fetchMaritalStatus() async {
    try {
      final response = await httpClient.get('$kBaseUrlv1/marital_status');
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _maritalStatus = Option.fromJson(jsonDecode(response.body)).data;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('maritalStatus', response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> fetchEducationSectors() async {
    try {
      final response = await httpClient.get('$kBaseUrlv1/education_sectors');
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _educationSectors = Option.fromJson(jsonDecode(response.body)).data;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('educationSectors', response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> fetchOccupations() async {
    try {
      final response = await httpClient.get('$kBaseUrlv1/occupations');
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _occupations = Option.fromJson(jsonDecode(response.body)).data;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('occupations', response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> fetchWorkSectors() async {
    try {
      final response = await httpClient.get('$kBaseUrlv1/work_sectors');
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _workSectors = Option.fromJson(jsonDecode(response.body)).data;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('workSectors', response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> fetchResidenceTypes() async {
    try {
      final response = await httpClient.get('$kBaseUrlv1/residence_types');
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _residenceTypes = Option.fromJson(jsonDecode(response.body)).data;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('residenceTypes', response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> fetchStates() async {
    try {
      final response = await httpClient.get('$kBaseUrlv1/states');
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _states = Option.fromJson(jsonDecode(response.body)).data;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('states', response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<void> fetchLGAs(String state) async {
    try {
      final response = await httpClient.get('$kBaseUrlv1/states/$state/lgas');
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _lgas = Option.fromJson(jsonDecode(response.body)).data;
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
      final response = await httpClient.get('$kBaseUrlv1/banks');
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _banks = Option.fromJson(jsonDecode(response.body)).data;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('banks', response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }
}
