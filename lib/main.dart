import 'package:banking_app_exam/models/card_model.dart';
import 'package:banking_app_exam/pages/add_card_page.dart';
import 'package:banking_app_exam/pages/cards_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() async{
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    isConnected = false;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    isConnected = false;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CardsPage(),
      routes: {
        CardsPage.id: (context) => CardsPage(),
        AddCardPage.id: (context) => AddCardPage(),
      },
    );
  }
}