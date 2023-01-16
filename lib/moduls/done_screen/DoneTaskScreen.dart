import 'package:flutter/material.dart';
class DoneTaskScreen extends StatelessWidget {
  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Done Task' ,
        style: TextStyle(
          color: Colors.black ,
          fontSize: 30 ,
          fontWeight: FontWeight.w900 ,
        ),
      ),
    ) ;
  }
}
