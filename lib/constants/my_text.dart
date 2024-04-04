import 'package:flutter/material.dart';

import 'my_colors.dart';

OutlineInputBorder textformBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)
  ),
  borderSide: BorderSide(color: my_boarder, width: 1),
);

TextStyle txtStyle= TextStyle(color: my_violet,fontSize: 25,fontWeight: FontWeight.bold);

TextStyle whitePoppinsBoldM18=const TextStyle(
    fontFamily: 'PoppinsMedium',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color:my_white
);