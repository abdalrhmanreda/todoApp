import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/components/components.dart';
class BottomSheetScreen extends StatelessWidget {
   BottomSheetScreen({Key? key}) : super(key: key);

  var  TasksContollor = TextEditingController() ;
  var  DateContollor = TextEditingController() ;
  var  TimeContollor = TextEditingController() ;
  var  StatusContollor = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            defaultTextFormFelid(
              isPass: false ,
              type: TextInputType.text ,
              controller: TasksContollor ,
              validate: (value)
              {
                if(value!.isEmpty)
                {
                  return 'should write task' ;
                }
                else
                {
                  return null ;
                }
              },
              label: 'Task' ,
              prefix: Icons.title ,
            ),
            const SizedBox(height:10) ,
            defaultTextFormFelid(
              isPass: false,
              type: TextInputType.datetime ,
              controller: TimeContollor ,
              validate: (value)
              {
                if(value!.isEmpty)
                {
                  return 'should write time' ;
                }
                else
                {
                  return null ;
                }
              },
              ontap: ()
              {
                showTimePicker(
                    context: context,
                    initialTime:TimeOfDay.now() ,
                ).then((value)
                {
                  TimeContollor.text=value.toString()!  ;
                }) ;
              },

              label: 'Time' ,
              prefix: Icons.watch_later_outlined ,
            ) ,
            const SizedBox(height:10) ,

            defaultTextFormFelid(
              isPass: false,
              type: TextInputType.datetime ,
              controller: DateContollor ,
              validate: (value)
              {
                if(value!.isEmpty)
                {
                  return 'should write Date' ;
                }
                else
                {
                  return null ;
                }
              },
              ontap: ()
              {
                showDatePicker(
                    context: context,
                    initialDate:DateTime.now(),
                  firstDate:DateTime.now() ,
                  lastDate:DateTime.parse('2023-5-1'),
                )
                    .then((value)
                {
                  print(DateFormat.yMMMd().format(value!)) ; 
                }
                );
              },
              label: 'Date' ,
              prefix: Icons.date_range ,
            ) ,
            const SizedBox(height:10) ,

            defaultTextFormFelid(
              isPass: false,
              type: TextInputType.text ,
              controller: StatusContollor ,
              validate: (value)
              {
                if(value!.isEmpty)
                {
                  return 'should write Status' ;
                }
                else
                {
                  return null ;
                }
              },
              label: 'Status' ,
              prefix: Icons.date_range ,
            ) ,

          ],
        ),

    );
  }
}
