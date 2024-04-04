import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:meher_nikkah/Providers/main_provider.dart';
import 'package:meher_nikkah/Screens/about_you_screen.dart';
import 'package:meher_nikkah/Screens/registration_screen.dart';
import 'package:meher_nikkah/constants/my_colors.dart';
import 'package:meher_nikkah/constants/my_functions.dart';
import 'package:meher_nikkah/widgets/my_widgets.dart';
import 'package:provider/provider.dart';

import '../constants/my_text.dart';

class KnowEachOtherScreen extends StatelessWidget{
   KnowEachOtherScreen({super.key});

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
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
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: height*0.04,),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,top: 8),
                              child: InkWell(
                                onTap: (){
                                  callNext(RegistrationScreen(), context);
                                },
                                  child: const Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black38,)),
                            ),
                          ],),
                        Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: height*0.07),
                              child: Text("      Let's Know\neach other better!",style: txtStyle),
                            )),
                         SizedBox(height: height*0.08,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: DotsIndicator(
                              dotsCount: 5,
                              position: 1,
                              axis: Axis.horizontal,
                              decorator: DotsDecorator(
                                spacing: EdgeInsets.all(3),
                                activeColor: Colors.black,
                                size: const Size.square(8.0),
                                activeSize: Size.square(8.0),
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
                  SizedBox(height: height*0.06,),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Container(
                        width: width*0.86,
                        height: 50,
                        child: TextFormField(
                          style: const TextStyle(
                            color: my_black,
                            fontSize: 14,
                            fontFamily:'Poppins',
                          ),
                          textInputAction: TextInputAction.next,
                          readOnly: true,
                           controller: value.dobTC,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Date Of Birth',
                            hintText: 'Select Date Of Birth',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: textformBorder,
                            focusedBorder: textformBorder,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down,size: 25,color: Colors.black38,)
                          ),
                          onTap: (){
                             value.selectDOB(context);
                          },
                          validator: (text){
                            if(text!.isEmpty){
                              return 'Please Enter Correct Date of Birth';
                            } else{
                              return null;
                            }
                          },
                        ),
                      );
                    }
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  textFormField(context, value.familyNameTC, "Family Name", 'Type your Family Name',TextInputType.text),

                  const SizedBox(
                    height: 20,
                  ),
                  textFormField(context,value.fatherNameTC,'Father Name','Type your Father Name',TextInputType.text),


                  const SizedBox(
                    height: 20,
                  ),
                  // Consumer<MainProvider>(
                  //   builder: (context,value,child) {
                  //     return Autocomplete<String>(
                  //       optionsBuilder: (TextEditingValue textEditingValue) {
                  //         return (value.organisationList)
                  //             .where((String item) => item
                  //             .toLowerCase()
                  //             .contains(textEditingValue.text.toLowerCase()))
                  //             .toList();
                  //       },
                  //       displayStringForOption: (String option) => option,
                  //       fieldViewBuilder: (BuildContext context,
                  //           TextEditingController fieldTextEditingController,
                  //           FocusNode fieldFocusNode,
                  //           VoidCallback onFieldSubmitted) {
                  //         WidgetsBinding.instance.addPostFrameCallback((_) {
                  //            fieldTextEditingController.text = value.religionTC.text;
                  //         });
                  //
                  //         return Container(
                  //           width:  width*0.86,
                  //           child: TextFormField(
                  //             style: const TextStyle(
                  //               color: my_black,
                  //               fontSize: 14,
                  //               fontFamily:'Poppins',
                  //             ),
                  //             decoration:  InputDecoration(
                  //                 labelStyle: const TextStyle(
                  //                   color: my_black,
                  //                   fontSize: 14,
                  //                   fontFamily:'Poppins',
                  //                 ),
                  //                 suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp,size: 25,color: Colors.black38,),
                  //
                  //                 border: textformBorder,
                  //                 enabledBorder: textformBorder,
                  //                 focusedBorder: textformBorder,
                  //                 fillColor: Colors.white,
                  //                 contentPadding: const EdgeInsets.symmetric(
                  //                     vertical: 10.0, horizontal: 10.0),
                  //                 labelText: 'Religion',
                  //                 errorBorder: const OutlineInputBorder(
                  //                     borderSide:
                  //                     BorderSide(color: Colors.red, width: .5))),
                  //             validator: (text) =>
                  //             text == '' || ! value.organisationList.contains(text)
                  //                 ? 'SELECT ORGANIZATION'
                  //                 : null,
                  //             onChanged: (txt) {
                  //
                  //             },
                  //             controller: fieldTextEditingController,
                  //             focusNode: fieldFocusNode,
                  //
                  //           ),
                  //         );
                  //       },
                  //
                  //       onSelected: (String selection) {
                  //          value.religionTC.text=selection;
                  //       },
                  //       optionsViewBuilder: (BuildContext context,
                  //           AutocompleteOnSelected<String> onSelected,
                  //           Iterable<String> options) {
                  //         return Align(
                  //           alignment: Alignment.topLeft,
                  //           child: Material(
                  //             child: Container(
                  //               width:  width*0.86,
                  //               height: height*0.2,
                  //               color: Colors.white,
                  //               child: ListView.builder(
                  //                 padding: const EdgeInsets.all(10.0),
                  //                 itemCount: options.length,
                  //                 itemBuilder: (BuildContext context, int index) {
                  //                   final String option = options.elementAt(index);
                  //
                  //                   return GestureDetector(
                  //                     onTap: () {
                  //                       onSelected(option);
                  //                     },
                  //                     child: Container(
                  //                       color: Colors.white,
                  //                       height: 50,
                  //                       width: width*0.86,
                  //                       child: Column(
                  //                           crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                           children: [
                  //                             Text(option,
                  //                                 style: const TextStyle(
                  //                                     fontWeight: FontWeight.bold)),
                  //                             const SizedBox(height: 10)
                  //                           ]),
                  //                     ),
                  //                   );
                  //                 },
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   }
                  // ),
                  //
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  autocomplete(value.nationalityList, value.nationalityTC, "Nationality", "SELECT NATIONALITY"),

                  const SizedBox(
                    height: 20,
                  ),
                  textFormField(context, value.emailIdTC, "Email", "Type your email address",TextInputType.text),

                  const SizedBox(
                    height: 20,
                  ),

                  textFormField(context, value.passwordTC, "Profile Password", "Enter your password",TextInputType.text),

                  const SizedBox(height: 15,)
                ],
              );
            }
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          if(_formKey.currentState!.validate()) {
            callNext(AboutYouScreen(), context);
          }
        },
        child: Container(
          height: height*0.07,
          color: my_violet,
          child: const Center(
            child: Text("Continue",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),),
          ),),
      ),
    );
  }

}