import 'package:assignment/model/Quiz.dart';
import 'package:assignment/screens/questions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => Quiz(),
        //child: Questions(),
        child: MyApp(),
        ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Inter",
        textTheme: TextTheme()
      ),
      home: Questions()
    );
  }
}

