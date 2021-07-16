import 'package:flutter/material.dart';

import './transactionCard.dart';
import '../constants.dart';

import '../screens/transactionDetails.dart';


class TransactionList extends StatelessWidget {
  final List data;
  TransactionList(this.data);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
