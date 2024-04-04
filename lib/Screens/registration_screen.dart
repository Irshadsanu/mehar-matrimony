import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meher_nikkah/Providers/LoginProvider.dart';
import 'package:meher_nikkah/Providers/main_provider.dart';
import 'package:meher_nikkah/Screens/know_each_other_screen.dart';
import 'package:meher_nikkah/constants/my_colors.dart';
import 'package:meher_nikkah/constants/my_functions.dart';
import 'package:meher_nikkah/constants/my_text.dart';
import 'package:meher_nikkah/widgets/my_widgets.dart';
import 'package:provider/provider.dart';

import 'Otp_Page.dart';

class RegistrationScreen extends StatelessWidget{
  RegistrationScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    MainProvider mainProvider = Provider.of<MainProvider>(context,listen: false);

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var height = queryData.size.height;
    var width = queryData.size.width;
   return Scaffold(

     body: SingleChildScrollView(
       child: Form(
         key: _formKey,
         child: Consumer<MainProvider>(
           builder: (context,value,child) {
             return Column(
               children: [
                 Stack(
                   children: [
                  Align(
                    alignment: Alignment.topCenter,
                   child: Container(
                      width: width,
                     height: height/2.5,
                    decoration:  const BoxDecoration(
                     image: DecorationImage(
                         image: AssetImage(
                             "assets/background.png"
                         ),
                         fit:BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, //New
                            blurRadius: 25.0,
                            offset: Offset(0, -75))
                      ],
                    ),

                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                          SizedBox(height: height*0.04,),
                         Row(
                           children: const [
                           Padding(
                             padding: EdgeInsets.only(left: 10.0,top: 8),
                             child: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black38,),
                           ),
                        ],),
                      SizedBox(height: height*0.005,),
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text("Find Exactly the",
                              style: TextStyle(
                                  color: my_black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),),
                          )),
                         const Padding(
                           padding: EdgeInsets.only(top: 8.0),
                           child: Text("Right Partner for you!",
                             style: TextStyle(
                                 color: my_black,
                                 fontSize: 18,
                                 fontWeight:FontWeight.bold
                             ),),
                         ),
                       const SizedBox(height: 15,),
                       Container(
                        height: height*0.08,
                        width: width*0.7,
                        child: Image.asset("assets/logo.png"),
                       ),
                       SizedBox(height: height*0.03,),
                       Container(
                          child:  Text("Register",
                            style: txtStyle
                            )),
                       SizedBox(height: height*0.04,),
                       Align(
                         alignment: Alignment.centerRight,
                         child: Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                           child: DotsIndicator(
                            dotsCount: 5,
                            position: 0.0,
                            axis: Axis.horizontal,
                            decorator: DotsDecorator(
                              spacing: const EdgeInsets.all(3),
                              activeColor: Colors.black,
                              size: const Size.square(8.0),
                              activeSize: const Size.square(8.0),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onTap: (pos) {
                              // setState(() => _currentPosition = pos);
                            },
                          ),
                        ),
                       ),
                      ],
                     ),
                    ),
                  )
                   ],
                 ),
               SizedBox(height: height*0.02,),

               autocomplete(value.relation, value.relationTC, "SELECT", "SELECT RELATION"),
                 const SizedBox(
                   height: 20,
                 ),
                 textFormField(context,value.firstNameTC, "First Name", 'Type your first name',TextInputType.text),

                 const SizedBox(
                   height: 20,
                 ),
                 textFormField(context,value.lastNameTC, "Last Name", 'Type your last name',TextInputType.text),

                 const SizedBox(
                   height: 20,
                 ),
                 Container(
                   width: width*0.86,
                    // height: 50,
                   child: Consumer<MainProvider>(
                     builder: (context,value,child) {
                       return TextFormField(
                         controller: value.mobileNoTC,
                         style: const TextStyle(
                           color: my_black,
                           fontSize: 14,
                           fontFamily:'Poppins',
                         ),
                         textInputAction: TextInputAction.next,
                         keyboardType: TextInputType.phone,
                         inputFormatters: [
                           LengthLimitingTextInputFormatter(10)
                         ],
                         decoration: InputDecoration(
                             border: const OutlineInputBorder(),
                             labelText: 'Mobile Number',
                             labelStyle: const TextStyle(color: my_black,),
                             hintText: 'Type your mobile number',
                             filled: true,
                             enabledBorder: textformBorder,
                             focusedBorder:  textformBorder,
                             fillColor: Colors.white
                         ),
                         validator: (value) {
                           if (value!.trim().isEmpty) {
                             return "Please Enter Mobile Number";
                           } else {
                             return null;
                           }
                         },
                       );
                     }
                   ),
                 ),

                 const SizedBox(
                   height: 20,
                 ),
                 autocomplete(value.gender,value.genderTC,'GENDER',"SELECT GENDER"),

                 SizedBox(height: height*0.033,),

                 InkWell(
                   onTap: () {
                     if (_formKey.currentState!.validate()) {
                       mainProvider.registerUser();
                       callNext(KnowEachOtherScreen(), context);
                     }
                   },
                   child: Container(
                     height: height*0.057,
                     width: width*0.8,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       color: my_violet,
                     ),
                     child: const Center(
                       child: Text("Create Free Account",
                         style: TextStyle(
                             color:Colors.white,
                             fontSize: 15
                         ),),
                     ),

                   ),
                 ),
                 SizedBox(height: height*0.06,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:  [
                     const Text("Already have an account? ",
                     style: TextStyle(color: my_black,fontSize: 14),),
                     TextButton(
                       onPressed: (){callNext(const Otp_Page(), context);},
                       child: const Text("LOGIN",
                       style: TextStyle(color: Colors.green,fontSize: 16),),
                     )

                   ],
                 ),
                 const SizedBox(height: 8,)
               ],
             );
           }
         ),
       ),
     ),

   );
  }

}