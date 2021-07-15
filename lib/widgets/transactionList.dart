import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './transactionCard.dart';
import '../constants.dart';

import '../screens/transactionDetails.dart';

import '../provider/transactionProvider.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    void onError(String error) async {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
      print(error);
    }

    return FutureBuilder(
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
          return totaltransactions(snapshot.data, context);
        });
  }

  Widget totaltransactions(data, context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    'Number of Transactions: ',
                    style: TextStyle(fontSize: 11),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        '${data.length}',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          // height: MediaQuery.of(context).size.height / 1.1,
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransactionDetailsScreen(
                                details: data[index],
                              )),
                    );
                  },
                  child: TransactionCard(data: data[index]));
            },
          ),
        ),
      ],
    );
  }
}
