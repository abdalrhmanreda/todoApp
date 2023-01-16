import 'package:flutter/material.dart';
import 'package:todo/layout/layoutHome.dart';

import 'moduls/bottomSheet/bottomSheet.dart';


void main()
{
  runApp(TodoApp()) ;
}

class TodoApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: abdo(),
    );
  }

}