import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

callNext(var className, var context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => className),
  );
}

callNextReplacement(var className, var context){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => className),
  );
}


back(var context) {
  Navigator.pop(context);
}
void finish(context) {
  Navigator.pop(context);
}
hideKeyboard(context) {

  FocusScope.of(context).requestFocus(FocusNode());
}
void showLoaderDialog(BuildContext context){
  print("loaded");

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
         color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child:  const Padding(
            padding: EdgeInsets.all(12.0),

            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    ),
  );

}
