import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:meher_nikkah/Providers/main_provider.dart';
import 'package:meher_nikkah/Screens/create_profile_screen.dart';
import 'package:meher_nikkah/constants/my_functions.dart';
import 'package:meher_nikkah/widgets/my_widgets.dart';
import 'package:provider/provider.dart';

import '../constants/my_colors.dart';
import '../constants/my_text.dart';

class EducationAndCareer extends StatelessWidget {
   EducationAndCareer({Key? key}) : super(key: key);

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
                  SizedBox(height: height*0.06,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(children: const [
                      Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black38,),
                    ],),
                  ),
                  Text("Education and Career",style: txtStyle),
                  SizedBox(height: height*0.06),

                  autocomplete(value.educationList, value.highestEducationTC, "Highest Education", "SELECT HIGHEST EDUCATION"),

                  SizedBox(height: height*0.03,),
                  autocomplete(value.professionList, value.professionTC, "Profession", "SELECT PROFESSION"),
                  SizedBox(height: height*0.03,),
                  Text("Location Details",style: txtStyle,),
                  SizedBox(height: height*0.03,),
                  autocomplete(value.nationalityList, value.homeCountryTC, "Home Country", "SELECT HOME COUNTRY"),

                  SizedBox(height: height*0.03,),
                  autocomplete(value.stateList, value.homeStateTC, "Home State", "SELECT HOME STATE"),

                  SizedBox(height: height*0.03,),
                  autocomplete(value.nationalityList, value.presentCountryTC, "Present Country", "SELECT PRESENT COUNTRY"),

                  SizedBox(height: height*0.03,),
                  autocomplete(value.stateList, value.presentStateTC, "Present State", "SELECT PRESENT STATE"),

                  SizedBox(height: height*0.03,),
                  autocomplete(value.stateList, value.presentCityTC, "Present City", "SELECT PRESENT CITY"),


                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25.0,top: 28),
                      child: DotsIndicator(
                        dotsCount: 5,
                        position: 3,
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
              );
            }
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            callNext(CreateProfileScreen(), context);
          }
        },
        child: Container(
          height: height*0.07,
          color: my_violet,
          child: const Center(
            child: Text("Next",
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
