import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/main_provider.dart';
import '../constants/my_colors.dart';
import '../constants/my_text.dart';

Widget textFormField(BuildContext context,TextEditingController controller,String labelText,String hintText,TextInputType input){
  return  Container(
    width: MediaQuery.of(context).size.width*0.86,
    // height: 50,
    child: Consumer<MainProvider>(
        builder: (context,value,child) {
          return TextFormField(
            controller: controller,
            style: const TextStyle(
              color: my_black,
              fontSize: 14,
              fontFamily:'Poppins',
            ),
            keyboardType: input,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: labelText,
                labelStyle: const TextStyle(color: my_black,),
                hintText: hintText,
                filled: true,
                enabledBorder: textformBorder,
                focusedBorder:  textformBorder,
                fillColor: Colors.white
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return hintText;
              } else {
                return null;
              }
            },
          );
        }
    ),
  );
}

Widget autocomplete(List<String>list,TextEditingController controller,String labelText,String validation){
  return Consumer<MainProvider>(
      builder: (context,value,child) {
        return Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return (list)
                .where((String item) => item
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()))
                .toList();
          },
          displayStringForOption: (String option) => option,
          fieldViewBuilder: (BuildContext context,
              TextEditingController fieldTextEditingController,
              FocusNode fieldFocusNode,
              VoidCallback onFieldSubmitted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              fieldTextEditingController.text = controller.text;
            });

            return Container(
              width:  MediaQuery.of(context).size.width*0.86,
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
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 25,
                      color: Colors.black38,
                    ),
                    border: textformBorder,
                    enabledBorder: textformBorder,
                    focusedBorder: textformBorder,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    labelText: labelText,
                    errorBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.red, width: .5))),
                validator: (text) =>
                text == '' || !list.contains(text)
                    ? validation
                    : null,
                onChanged: (txt) {

                },
                controller: fieldTextEditingController,
                focusNode: fieldFocusNode,

              ),
            );
          },

          onSelected: (String selection) {
            controller.text=selection;
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                child: Container(
                  width:  MediaQuery.of(context).size.width*0.86,
                  height: MediaQuery.of(context).size.height*0.3,
                  color: Colors.white,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String option = options.elementAt(index);

                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                        },
                        child: Container(
                          color: Colors.white,
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.86,
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(option,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
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
  );
}