import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/transactionList.dart';
import '../provider/transactionProvider.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    void onError(String error) async {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
      print(error);
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Transactions',
                style: TextStyle(color: primaryColor),
              ),
            ),
            body: FutureBuilder(
                future: Provider.of<TransactionProvider>(context, listen: false)
                    .getTransactions()
                    .catchError((Object error) => onError(error.toString())),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                      child: CircularProgressIndicator(),
                    ));
                  } else {
                    if (snapshot.error != null) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                  }
                  if (snapshot.data != null) {
                    return TransactionList(snapshot.data);
                  }
                  return Center(child: Text("Empty Data..."));
                })));
  }
}
