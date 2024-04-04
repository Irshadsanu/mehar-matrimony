import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:meher_nikkah/Providers/main_provider.dart';
import 'package:meher_nikkah/Screens/education_and_career.dart';
import 'package:meher_nikkah/Screens/know_each_other_screen.dart';
import 'package:meher_nikkah/models/SkinColorModel.dart';
import 'package:meher_nikkah/widgets/my_widgets.dart';
import 'package:provider/provider.dart';
import '../constants/my_colors.dart';
import '../constants/my_functions.dart';
import '../constants/my_text.dart';

class AboutYouScreen extends StatelessWidget{
    AboutYouScreen({super.key});
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
                              padding: const EdgeInsets.only(left: 10.0,top: 8),
                              child: InkWell(
                                  onTap: (){
                                    callNext(KnowEachOtherScreen(), context);
                                  },
                                  child: const Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black38,)),
                            ),
                          ],),
                        Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: height*0.07),
                              child: const Text("Tell us about you..",style: TextStyle(color: my_violet,fontSize: 24,fontWeight: FontWeight.bold),),
                            )),
                        SizedBox(height: height*0.08,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: DotsIndicator(
                              dotsCount: 5,
                              position: 2,
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
                  SizedBox(height: height*0.05,),
                   textFormField(context,  value.heightTC, 'Height', 'Type your height', TextInputType.number),
                  const SizedBox(height: 20,),
                  textFormField(context,  value.weightTC, 'Weight', 'Type your weight', TextInputType.number),

                  const SizedBox(height: 20,),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: width*0.86,
                          height: height*0.14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 0.1,color: my_boarder),
                              ),
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              enabled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: "marital status",
                              labelStyle: const TextStyle(color: my_black,fontSize: 18,fontWeight: FontWeight.bold),
                              enabledBorder: textformBorder,
                              border: textformBorder,
                              disabledBorder: textformBorder,
                              focusedBorder: textformBorder,
                              contentPadding: const EdgeInsets.symmetric(vertical: 50,horizontal: 19),

                            ),
                          ),
                        ),
                      ),
                        Consumer<MainProvider>(
                          builder: (context,value,child) {
                          return Container(
                            // height: 125,
                            // width: 400,
                             height: height*0.15,
                             width: width*0.9,
                             // color: Colors.green,
                             child: Consumer<MainProvider>(
                               builder: (context,value,child) {
                                 return GridView.builder(
                                   padding: EdgeInsets.zero,
                                     scrollDirection: Axis.vertical,
                                     physics: const ScrollPhysics(),
                                     itemCount: value.maritialstatusList.length,
                                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                         crossAxisSpacing: 0.2,
                                         mainAxisSpacing: 0.5,
                                         childAspectRatio: 5,
                                         mainAxisExtent: 35,
                                         crossAxisCount: 2
                                     ),
                                     itemBuilder: (BuildContext context, int index) {
                                       var item=value.maritialstatusList[index];
                                       return  Padding(
                                         padding: const EdgeInsets.only(top: 4),
                                         child: Container(
                                           width: 10,
                                           child: CheckboxListTile(
                                             visualDensity: VisualDensity.compact,
                                             title: Text(item.name.toString()),
                                             dense: true,
                                             controlAffinity: ListTileControlAffinity.leading,
                                             activeColor: my_black,
                                             checkColor: Colors.white,
                                             value: item.value,
                                             side:const BorderSide(color: my_black, width: 1,),
                                             checkboxShape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(5)),
                                             onChanged: (bool? value) {
                                               mainProvider.selectMaritalStatusFun(index, item.name);
                                               },
                                           ),
                                         ),
                                       );
                                     });
                               }
                             ),
                             );
                            }
                          )
                    ],
                  ),
                  const SizedBox(height: 20,),

                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Autocomplete<SkinColorModel>(
                        optionsBuilder:
                            (TextEditingValue textEditingValue) {
                          return value.complexionList
                              .where((SkinColorModel list) => list
                              .name
                              .toLowerCase()
                              .startsWith(textEditingValue.text
                              .toLowerCase()))
                              .toList();
                        },
                        displayStringForOption:
                            (SkinColorModel option) => option.name,
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController
                            fieldTextEditingController,
                            FocusNode fieldFocusNode,
                            VoidCallback onFieldSubmitted) {
                          WidgetsBinding.instance.addPostFrameCallback((
                              _) { // <--- this part

                            fieldTextEditingController.text = value.complexionTC.text;
                          });
                          return Container(
                            width:  width*0.86,
                            child: TextFormField(
                              style: const TextStyle(
                                color: my_black,
                                fontSize: 14,
                                fontFamily:'Poppins',
                              ),
                              decoration:  InputDecoration(
                                  labelStyle: const TextStyle(
                                    color: my_black,
                                    fontSize: 14,
                                    fontFamily:'Poppins',
                                  ),
                                  suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp,size: 25,color: Colors.black38,),

                                  border: textformBorder,
                                  enabledBorder: textformBorder,
                                  focusedBorder: textformBorder,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  labelText: 'Complexion',
                                  errorBorder: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.red, width: .5))),
                              // validator: (text) =>
                              // text == '' || !value.complexion.contains(text)
                              //     ? 'SELECT COMPLEXION'
                              //     : null,
                              onChanged: (txt) {

                              },
                              controller: fieldTextEditingController,
                              focusNode: fieldFocusNode,

                            ),
                          );
                        },

                        onSelected: (SkinColorModel selection) {
                           value.complexionTC.text=selection.name;
                        },
                        optionsViewBuilder: (BuildContext context,
                            AutocompleteOnSelected<SkinColorModel> onSelected,
                            Iterable<SkinColorModel> options) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              child: Container(
                                width:  width*0.86,
                                height: height*0.2,
                                color: Colors.white,
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(10.0),
                                  itemCount: options.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final SkinColorModel option = options.elementAt(index);

                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        height: 50,
                                        width: width*0.86,
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    color: option.color,
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Text(option.name,
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold)),
                                                ],
                                              ),

                                              const SizedBox(height: 10)
                                            ]),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  ),
                  const SizedBox(height: 20,),

                  autocomplete(value.bodyTypeList, value.bodyTypeTC, "Body Type", "SELECT BODY TYPE"),

                  const SizedBox(height: 20,),

                  autocomplete(value.disabilityList, value.physicallyChallengedTC, "Physically Challenged", "SELECT A VALUE"),

                  SizedBox(height: 10,),


                ],
              );
            }
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          if(_formKey.currentState!.validate()) {
            callNext(EducationAndCareer(), context);
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
