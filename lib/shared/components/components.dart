import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextFormFelid({
  required bool isPass ,
  required TextInputType type ,
  required TextEditingController controller ,
  String? Function(String?)?onSubmitted ,
  String? Function(String?)?onChanged,
  required String? Function(String?)?validate ,
  String? hint ,
  required String label ,
  IconData? prefix ,
  IconData? sufffix ,
   Function?ontap ,
  bool?isclick = true ,


})=>TextFormField(

  obscureText: isPass,
  keyboardType:type ,
  controller: controller,
  onFieldSubmitted: onSubmitted,
  onChanged: onChanged,
  validator: validate,
  onTap: ()
  {
    ontap ;
  },
  enabled:isclick ,
  decoration: InputDecoration(
    label:  Text( label),
    prefix: Icon(
        prefix ,
      color: Colors.grey,
    ) ,
    suffixIcon: Icon(sufffix) ,
    border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))) ,

  ),

);