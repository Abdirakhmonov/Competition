import 'package:flutter/material.dart';
import 'package:lesson_35/budjet.dart';
import 'package:lesson_35/money.dart';
import 'package:lesson_35/musobaqa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize (
          preferredSize: Size.fromHeight(kToolbarHeight),
          child:  Competetion()),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          MainPage(),
          Budjet(),

        ],
      )
    );
  }
}
