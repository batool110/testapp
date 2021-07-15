import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Object details;
  const TransactionDetailsScreen({Key key, this.details}) : super(key: key);

  static DateFormat dateFormatter = DateFormat('d/M/y, EEEE');

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Transaction Details',
            style: TextStyle(color: primaryColor),
          ),
        ),
        body: transactionDetails(details, context, width),
      ),
    );
  }

  Widget transactionDetails(details, context, width) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: width / 1.1,
          child: Column(
            children: [
              Divider(
                height: 60,
                thickness: 1,
              ),
              Column(
                children: [
                  Text(
                    'Amount',
                    style: primaryHeading,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${details['amount']}',
                        style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(10.0, 10.0),
                              blurRadius: 8.0,
                              color: Colors.grey[400],
                            ),
                          ],
                          fontSize: getProportionateScreenWidth(30),
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        ' ${details['currencyCode']}',
                        style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(10.0, 10.0),
                              blurRadius: 8.0,
                              color: Colors.grey[350],
                            ),
                          ],
                          fontSize: getProportionateScreenWidth(25),
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                height: 60,
                thickness: 1,
              ),
              SizedBox(),
              Wrap(
                children: [
                  Container(
                    width: width / 2.25,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID: ',
                              style: amountStyle,
                            ),
                            Container(
                              width: width / 4.5,
                              child: Text(
                                details['id'],
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width / 2.25,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'BIC: ',
                              style: amountStyle,
                            ),
                            Container(
                              width: width / 4.5,
                              child: Text(
                                details['bic'],
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'IBAN: ',
                        style: amountStyle,
                      ),
                      Container(
                        width: width / 2,
                        child: Text(
                          details['iban'],
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date: ',
                        style: amountStyle,
                      ),
                      Container(
                        width: width / 2,
                        child: Text(
                          dateFormatter.format(DateTime.tryParse(
                            details['date'],
                          )),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Type: ',
                        style: amountStyle,
                      ),
                      Container(
                        width: width / 2,
                        child: Text(
                          details['type'],
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Description: ',
                        style: amountStyle,
                      ),
                      Container(
                        width: width / 2,
                        child: Text(
                          details['description'],
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
