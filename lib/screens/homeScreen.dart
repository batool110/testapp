import 'package:flutter/material.dart';

import '../widgets/transactionList.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Transactions', style: TextStyle(color: primaryColor),),
      ),
      body: TransactionList()));
  }
}
