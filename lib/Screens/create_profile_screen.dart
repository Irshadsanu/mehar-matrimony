import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:meher_nikkah/Providers/main_provider.dart';
import 'package:meher_nikkah/Screens/education_and_career.dart';
import 'package:meher_nikkah/Screens/upload_photosScreen.dart';
import 'package:meher_nikkah/widgets/my_widgets.dart';
import 'package:provider/provider.dart';
import '../constants/my_colors.dart';
import '../constants/my_functions.dart';
import '../constants/my_text.dart';

class CreateProfileScreen extends StatelessWidget{
   CreateProfileScreen({super.key});

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider=Provider.of<MainProvider>(context,listen: false);

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
                               padding: const EdgeInsets.only(left: 10.0,top: 15),
                               child: InkWell(
                                   onTap: (){
                                     callNext( EducationAndCareer(), context);
                                   },
                                   child: const Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black38,)),
                             ),
                           ],),
                         Center(
                             child: Padding(
                               padding: EdgeInsets.only(top: height*0.06),
                               child: Text("     Let's create\nyour profile now!",style: txtStyle),
                             )),
                       ],
                     ),
                   ),
                  SizedBox(height: height*0.052,),
                  autocomplete(value.organisationList, value.communityTC, "Community", "SELECT COMMUNITY"),

                   SizedBox(height: height*0.02,),
                  textFormField(context, value.hobbiesTC, "Hobbies", 'Type your Hobbies', TextInputType.text),
                  SizedBox(height: height*0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Father Status",
                        style: TextStyle(
                        color: my_black,
                        fontSize: 16,
                        fontFamily:'Poppins',
                      ),),
                      SizedBox(width: width*0.16,),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return FlutterRadioGroup(
                              titles: value.Status,
                              labelStyle: const TextStyle(color: Colors.white38),
                              labelVisible: false,
                              activeColor: Colors.blue,
                              titleStyle: const TextStyle(fontSize: 14),

                              defaultSelected: value.Status.indexOf(value.statusFather),
                              orientation: RGOrientation.HORIZONTAL,
                              onChanged: (index) {
                                value.radiogroup(index!);
                              });
                        }
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Mother Status",
                        style: TextStyle(
                          color: my_black,
                          fontSize: 16,
                          fontFamily:'Poppins',
                        ),),
                      SizedBox(width: width*0.16,),
                      Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return FlutterRadioGroup(
                                titles: value.Status,
                                labelStyle: const TextStyle(color: Colors.white38),
                                labelVisible: false,
                                activeColor: Colors.blue,
                                titleStyle: const TextStyle(fontSize: 14),

                                defaultSelected: value.Status.indexOf(value.statusMother),
                                orientation: RGOrientation.HORIZONTAL,
                                onChanged: (index) {
                                  value.radiogroup(index!);
                                });
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  textFormField(context, value.brothersTC, "Brothers", "Type number of Brothers", TextInputType.number),
                  SizedBox(height: height*0.02,),
                  textFormField(context, value.sistersTC, "Sisters", "Type number of Sisters", TextInputType.number),

                  SizedBox(height: height*0.02,),
                  textFormField(context, value.marriedBrothersTC, "Married Brothers", "Type number of married brothers", TextInputType.number),

                SizedBox(height: height*0.02,),
                  textFormField(context, value.marriedSistersTC, "Married Sisters", "Type number of married Sisters", TextInputType.number),

                  SizedBox(height: height*0.02,),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Container(
                        width: width*0.86,
                        child: TextFormField(
                          controller: value.profileDescriptionTC,
                          style: const TextStyle(
                            color: my_black,
                            fontSize: 14,
                            fontFamily:'Poppins',
                          ),
                          textInputAction: TextInputAction.next,
                          maxLines: null,
                          minLines: 4,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                               contentPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                              border: const OutlineInputBorder(),
                              labelText: 'Profile Description',
                              labelStyle: const TextStyle(color: my_black,fontSize: 15),
                              hintText: 'Describe about your profile in a few words..',
                              filled: true,
                              enabledBorder: textformBorder,
                              focusedBorder:  textformBorder,
                              fillColor: Colors.white
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Please enter profile description";
                            } else {
                              return null;
                            }
                          },
                        ),
                      );
                    }
                  ),
                  SizedBox(height: height*0.1,),
                  Container(
                     height: height*0.15,
                     width: width*0.64,
                   decoration: const BoxDecoration(
                     image: DecorationImage(
                     image: AssetImage(
                         "assets/matrimonylogo.png"
                     ),fit: BoxFit.fill,
                     scale: 0.2),
                  ),
                  )
               ],);
           }
         ),
       ),
     ),
     bottomNavigationBar: InkWell(
       onTap: (){
         if(_formKey.currentState!.validate()) {
           callNext(PhotosUpload(from: '',), context);
         }
         // callNext(PhotosUpload(from: '',), context);
       },
       child: Container(
         height: height*0.07,
         color: my_violet,
         child: const Center(
           child: Text("Save",
             style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 17
             ),),
         ),),
     ),
   );
  }

}