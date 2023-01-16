import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Center(
           child: SingleChildScrollView(
             scrollDirection: Axis.vertical,
             child: Column(
               mainAxisSize: MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                const Text(
                   'Sign in' ,
                   style: TextStyle(
                     fontSize: 25 ,
                     fontWeight: FontWeight.bold
                   ),
                 ) ,
                 const SizedBox(
                   height: 10 ,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    const Text(
                       'Don\'t have an account?',
                       style: TextStyle(
                         fontSize: 12 ,
                         fontWeight: FontWeight.w500 ,
                       ),
                     ) ,
                     MaterialButton(
                       onPressed: (){},
                       child: const Text(
                         'Register' ,
                         style: TextStyle(
                           fontWeight: FontWeight.w500 ,
                           color: Colors.blue ,
                           fontSize: 15 ,
                         ),
                       ),
                     ) ,
                   ],
                 ) ,
                 TextFormField(

                   decoration: InputDecoration(
                      labelText: 'Email' ,
                   ),
                   onChanged: (value)
                   {
                     print(value.toString()) ;
                   },
                   onFieldSubmitted: (value)
                   {
                     print(value.toString()) ;
                   },
                 ) ,
                 const SizedBox(
                   height: 20,
                 ) ,
                 TextFormField(
                   obscureText: true,
                   decoration: InputDecoration(
                     labelText: 'Password' ,
                     suffixIcon:Icon(Icons.visibility) ,
                   ),
                   onChanged: (value)
                   {
                     print(value.toString()) ;
                   },
                   onFieldSubmitted: (value)
                   {
                     print(value.toString()) ;
                   },
                 ) ,

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: (){} ,
                      child: Container(
                        child: Text(
                          'Forget Password?' ,
                          style: TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.w500 ,
                            color: Colors.blue ,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ) ,
                  ],
                ) ,

                 Container(
                   width: double.infinity,
                   decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)) ,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.blueGrey ,
                         blurRadius: 5 ,
                         offset: Offset(5, 5) ,
                       ) ,
                     ] ,
                   ),
                   child: MaterialButton(
                     onPressed: (){} ,
                     child: Container(
                       child: Text(
                         'Sign in' ,
                         style: TextStyle(
                           fontSize: 20 ,
                           fontWeight: FontWeight.w500 ,
                           color: Colors.white ,
                         ),
                         textAlign: TextAlign.end,
                       ),
                     ),
                   ),
                 ) ,



               ],
             ),
           ),
         ),
       ),
     );
  }
}
