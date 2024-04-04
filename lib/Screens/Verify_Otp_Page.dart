import 'package:flutter/material.dart';
import 'package:meher_nikkah/Screens/profile_screen.dart';
import 'package:meher_nikkah/constants/my_functions.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../Providers/LoginProvider.dart';
import '../constants/my_colors.dart';


// ignore: camel_case_types
class Verify_Otp_Page extends StatelessWidget {
  const Verify_Otp_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginprovider =
    Provider.of<LoginProvider>(context, listen: false);

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var height = queryData.size.height;
    var width = queryData.size.width;
    return Scaffold(
        body: Center(
            child: Container(
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
                        child: Text("Enter OTP Number"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 15),
                        child: Pinput(
                          controller: loginprovider.otp_verify,
                          length: 6,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          defaultPinTheme: PinTheme(
                              textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.9)))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: width/1.7,
                          child: ElevatedButton(onPressed: (){
                            loginprovider.verify(context);
                            // callNext(Profile(), context);
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
                                  Text("Verify OTP"),
                                  Icon(Icons.chevron_right)
                                ],
                              )),
                        ),
                      ),
                    ])))
    );
  }
}
