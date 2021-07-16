import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class TransactionCard extends StatelessWidget {
  final data;
  const TransactionCard({Key key, this.data}) : super(key: key);

  static DateFormat dateFormatter = DateFormat('d/M/y, EEE');
  static DateFormat formatter = DateFormat('d');
  static DateFormat monthFormatter = DateFormat('LLL');

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: getProportionateScreenWidth(65),
                    width: getProportionateScreenWidth(65),
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topLeft, colors: [
                        Colors.amberAccent[700],
                        primaryColor,
                        lightColor,
                        Colors.amber[100],
                      ]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          formatter.format(DateTime.tryParse(
                            "${data['date']}",
                          )),
                          textAlign: TextAlign.center,
                          style: dayStyle,
                        ),
                        Text(
                          monthFormatter.format(DateTime.tryParse(
                            "${data['date']}",
                          )),
                          style: monthStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${data['type']}",
                          style: headingStyle,
                        ),
                        SizedBox(height: 5),
                        Text(
                          dateFormatter.format(DateTime.tryParse(
                            "${data['date']}",
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Text(
                      "${data['amount']}",
                      style: amountStyle,
                    ),
                  ),
                  Text(
                    "${data['currencyCode']}",
                    style: currStyle,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
