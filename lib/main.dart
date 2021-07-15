import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/transactionProvider.dart';

import './screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TransactionProvider(),
        ),],
        child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          // scaffoldBackgroundColor: Color(0xFFE9E7E6),
          // primaryColor: 
        ),
        home: HomeScreen(),
      ),
    );
  }
}
