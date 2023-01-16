import 'package:flutter/material.dart';
class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: Text(
        'New Task' ,
        style: TextStyle(
          color: Colors.black ,
          fontSize: 30 ,
          fontWeight: FontWeight.w900 ,
        ),
      ),
    ) ;
  }
}
