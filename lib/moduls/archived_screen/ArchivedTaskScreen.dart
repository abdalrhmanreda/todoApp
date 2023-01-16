import 'package:flutter/material.dart';
class ArchivedTaskScreen extends StatelessWidget {
  const ArchivedTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: Text(
        'Archived Task' ,
        style: TextStyle(
          color: Colors.black ,
          fontSize: 30 ,
          fontWeight: FontWeight.w900 ,
        ),
      ),
    ) ;
  }
}
