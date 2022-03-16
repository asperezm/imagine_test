import 'package:flutter/material.dart';
import 'package:imagine/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imagine App',
      initialRoute: "HomePage",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: {
        "HomePage": (_) => HomePage()
        },
    );
  }
}
