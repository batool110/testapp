import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../baseUrl.dart';

import '../model/exceptionModel.dart';
// import '../model/transactionModel.dart';

class TransactionProvider with ChangeNotifier {
  
  VerificationException _exception;
  VerificationException get exception => _exception;

  Future getTransactions() async {
    // print('User: ' + user.message);
    final String url =
        '${baseUrl}transactions';
    print('Check user URL: ' + url);

    try {
      final response = await http.get(Uri.parse(url));

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        print('Success');

        // TransactionModel transactions = TransactionModel.fromJson(
        //     json.decode(response.body) as Map<String, dynamic>);

        // print(transactions.currencyCode);

        print(json.decode(response.body),);      

        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        print(
            'Response Status Code ${response.statusCode}: Can\'t send data to internet');
        // return response.body;
      } else {
        print(
            'status code is not 200 nor 400!!!!.... status code is: ${response.statusCode}');
      }
    } on SocketException{
      throw VerificationException('No Internet connection');
    } on HttpException{
      throw VerificationException('No service');
    } catch (err) {
      print(err);
    }

    notifyListeners();

    return null;
  }
}
