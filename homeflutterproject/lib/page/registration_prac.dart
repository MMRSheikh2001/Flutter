import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeflutterproject/page/login_page_prac.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

import 'package:radio_group_v2/radio_group_v2.dart' as v2;

class RegistrationPrac extends StatefulWidget {
  const RegistrationPrac({super.key});

  @override
  State<RegistrationPrac> createState() => _RegistrationPracState();
}

class _RegistrationPracState extends State<RegistrationPrac> {

  final TextEditingController name=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController confirmPassword=TextEditingController();
  final TextEditingController cell=TextEditingController();
  final TextEditingController address=TextEditingController();

final DateTimeFieldPickerPlatform dob=DateTimeFieldPickerPlatform.material;

final RadioGroupController genderController=RadioGroupController();

String? selectedGender;
DateTime? selectedDate;

final _formKey=GlobalKey<FormState>();






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsetsGeometry.all(16),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person)
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                        labelText: "example@email.com",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email)
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock)
                    ),
                    obscureText: true,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  TextField(
                    controller: confirmPassword,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock)
                    ),
                    obscureText: true,
                  ),


                  SizedBox(
                    height: 30,
                  ),

                  TextField(
                    controller: cell,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.call)
                    ),
                  ),


                  SizedBox(
                    height: 30,
                  ),


                  TextField(
                    controller: address,
                    decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.home)
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  DateTimeFormField(
                    decoration: InputDecoration(
                      labelText: "Date Of Birth",

                    ),
                    mode: DateTimeFieldPickerMode.date,
                    pickerPlatform: dob,
                    onChanged: (DateTime? value){
                      setState(() {
                        selectedDate=value;
                      });
                    },

                  )

                  ,

                  SizedBox(
                    height: 30,
                  ),

                 Align(
                   alignment: Alignment.centerLeft,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text("Gender",
                       style: TextStyle(
                         fontWeight: FontWeight.bold
                       ),
                       ),
                       v2.RadioGroup(
                         controller: genderController,
                         values: const["MALE","FEMALE","OTHER"],
                         indexOfDefault: 0,
                         orientation: RadioGroupOrientation.horizontal,
                         onChanged: (newValue){
                           setState(() {
                             selectedGender=newValue.toString();
                           });
                         },
                       )
                     ],

                   ),
                 ),


                  SizedBox(
                    height: 30,
                  ),


                  ElevatedButton(
                    onPressed: (){

                      String em=email.text;
                      String pass=password.text;

                      print("Email : $em \nPassword:$pass");

                      email.clear();
                      password.clear();

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Go to Console",
                            style: TextStyle(
                                color: Colors.green
                            ),
                          ))
                      );


                    },
                    child: Text("Register",
                      style:TextStyle(

                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: GoogleFonts.lato().fontFamily


                      ),


                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white
                    ),


                  )


                  ,

                  SizedBox(
                    height: 30,
                  ),

                  TextButton(onPressed: (){
Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=>LoginPagePrac())
);
                  },
                      child: Text(
                          "Go To Login",
                        style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline
                        ),
                      )

                  )





                ],
              )
          ),
        ),
      ),

    );
  }
}
