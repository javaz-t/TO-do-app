
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_dos/pages/home_page.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox('hey');
  runApp(MainApp());
}
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}