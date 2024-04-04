import 'package:flutter/material.dart';
import 'package:meher_nikkah/Screens/Verify_Otp_Page.dart';
import 'package:meher_nikkah/Screens/registration_screen.dart';
import 'package:meher_nikkah/constants/my_functions.dart';
import 'package:provider/provider.dart';

import '../Providers/LoginProvider.dart';
import '../constants/my_colors.dart';


class Otp_Page extends StatelessWidget {
  const Otp_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext cs) {
    LoginProvider loginprovider =
    Provider.of<LoginProvider>(cs, listen: false);


    MediaQueryData queryData;
    queryData = MediaQuery.of(cs);
    var height = queryData.size.height;
    var width = queryData.size.width;
    return Scaffold(
      key: loginprovider.scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          margin: EdgeInsets.all(25),
    height: 300,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: Colors.white,
    boxShadow:  [
    BoxShadow(
    color: Colors.black.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 54,
    )
    ]
    ),
    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
    // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Padding(
    padding: EdgeInsets.only(left: 15,right: 15,top: 55,bottom: 15),
    child: Text("Enter Mobile Number"),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 25,right: 25,top: 10),
    child: TextFormField(
    controller: loginprovider.PhoneNo,
    keyboardType: TextInputType.phone,
    maxLength: 10,
    decoration: const InputDecoration(
    border: OutlineInputBorder(), label: Text("Phone No")),
    ),
    ),
    Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
          width: width/1.7,
          child: ElevatedButton(onPressed: (){
            loginprovider.sendotp(cs);
            // callNext(Verify_Otp_Page(), context);
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),))
,      backgroundColor: MaterialStateProperty.all<Color>(my_violet),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Get OTP"),
              Icon(Icons.chevron_right)
            ],
          )),
          ),
    ),
    ])),

          const Padding(
            padding: EdgeInsets.only(top: 70),
            child: Text("New User?",style: TextStyle(fontSize: 15,color: Colors.black26),),
          ),
          TextButton(onPressed: (){
            callNext(RegistrationScreen(), cs);
          },
              child: const Text("Register Now",style: TextStyle(fontSize: 18,color: Colors.green),))

        ],
      )
    );
  }
}
