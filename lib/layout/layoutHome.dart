import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/moduls/archived_screen/ArchivedTaskScreen.dart';
import 'package:todo/moduls/bottomSheet/bottomSheet.dart';
import 'package:todo/moduls/done_screen/DoneTaskScreen.dart';
import 'package:todo/moduls/tasks_screen/NewTaskScreen.dart';

import '../shared/components/components.dart';

class abdo extends StatefulWidget {
  @override
  State<abdo> createState() => _abdoState();
}

class _abdoState extends State<abdo> {
  int currentindex=0 ;
  List<Widget>screens =
  [
    NewTaskScreen(),
    DoneTaskScreen() ,
    ArchivedTaskScreen() ,


  ];
  List<String>titles = [
    'New Tasks' ,
    'Done' ,
    'Archived'
  ];
  late Database database ;
  bool isBottomsheetShowen = false ;
  IconData Iconfab = Icons.edit;

  var  TasksContollor = TextEditingController() ;
  var  DateContollor = TextEditingController() ;
  var  TimeContollor = TextEditingController() ;
  var  StatusContollor = TextEditingController() ;




  var Scaffoldlkey = GlobalKey<ScaffoldState>() ;
  var FormKey= GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    createDataBase();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: Scaffoldlkey,
      appBar: AppBar(
        title: Text(
          titles[currentindex]
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: ()
        {

          if(isBottomsheetShowen)
          {
            if(FormKey.currentState!.validate())
            {
              insertToDataBase(
                  title:TasksContollor.toString() ,
                  date:DateContollor.toString(),
                  time:TimeContollor.toString(),
              );

              Iconfab = Iconfab ;
              isBottomsheetShowen=false ;
              Navigator.pop(context) ;
              setState(() {
                Iconfab = Icons.edit ;
              });
            }

          }
          else
          {
            Scaffoldlkey.currentState?.showBottomSheet(
                  (context) =>  Container(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: FormKey,
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
                            label: 'Date' ,
                            prefix: Icons.date_range ,
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
                    ),

                  ),
            );
            setState(() {
              Iconfab = Icons.add ;
            });

            isBottomsheetShowen=true ;
          }
        },
        child:  Icon(
            Iconfab
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 50,
        currentIndex: currentindex,
        onTap: (index)
        {
          setState(() {
            currentindex=index ;
          });
        },
        items: const[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu
            ) ,
            label: 'Tasks',

          ) ,
          BottomNavigationBarItem(
            icon: Icon(
                Icons.done
            ) ,
            label: 'Done',

          ) ,
          BottomNavigationBarItem(
            icon: Icon(
                Icons.archive_outlined
            ) ,
            label: 'Archived',

          ) ,

        ],
      ),
      body:screens[currentindex],


    );


  }
  Future<String>getname() async
  {

    return 'Abdalrhman Reda' ;
  }

   // Sqfilte

  void createDataBase()async
  {
      database = await openDatabase(
         'todo.db' ,
       version: 1 ,
       onCreate: (database , version)
       {
         print('database created') ;
          database.execute(
              'create table tasks (id INTEGER PRIMARY KEY ,title text ,date text , time text , status text)'
         ).then((value)
          {
            print('table is created') ;
          }).catchError((error)
          {
           print('error on create table ${error.toString()}') ;
          });
       } ,
       onOpen: (database)
       {
         print('database opened') ;
       } ,
     );
  }

  Future insertToDataBase({
  required String title ,
    required String date,
    required String time,

})async
  {
   return await database.transaction((txn)async
    {
      txn.rawInsert(
          'insert into tasks(title , date , time , status) values("$title","$date","$time","new")'
      ) ;


    }).then((int ?value)
    {
      print('${value} inserted successfully ') ;
    }).catchError((e){print(e.toString());}) ;
  }

  void deleteFromDataBase(){}

  void getFromDataBase(){}

  void UpdateDataBase(){}
}
