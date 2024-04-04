// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meher_nikkah/Screens/profile_screen.dart';
import 'package:meher_nikkah/Screens/registration_screen.dart';

import '../Screens/Verify_Otp_Page.dart';
import '../constants/my_functions.dart';

class LoginProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  String VerificationId ="";
  TextEditingController otp_verify =TextEditingController();
  TextEditingController PhoneNo =TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  Future<void>sendotp(BuildContext context)async{
    
    db.collection("USER").get().then((PHvalue) async {
      for(var i in PHvalue.docs){
        if(i.data()["PHONE"] == "+91${PhoneNo.text}"){
          await auth.verifyPhoneNumber(
            phoneNumber: "+91${PhoneNo.text}",
            verificationCompleted: (PhoneAuthCredential credential)async{
              print(PhoneNo.text);
              await auth.signInWithCredential(credential);
            },
            verificationFailed: (FirebaseAuthException e){
              if(e.code == "invalid-phone-number"){
                print("provided phone number is invalid");
              }
            },
            codeSent: (String verificationId , int ? resendToken){
              VerificationId = verificationId;
              log("Verification Id : $verificationId");
              callNextReplacement(const Verify_Otp_Page(), context);
            },
            codeAutoRetrievalTimeout: (String verificationId){},
            timeout: const Duration(seconds: 60),
          );
        }
        else if(PhoneNo.text.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("enter your registered mobile number"),
              duration: Duration(milliseconds:100),

            )
          );
                // ScaffoldMessenger.of(context).removeCurrentSnackBar();

        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Number not Matched,Register Now"),
                duration: Duration(milliseconds:100),

              )
          );
        }
      }
    });
    
    


  }


  Future<void>verify( BuildContext context)async{
    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(verificationId: VerificationId, smsCode:otp_verify.text);
    await auth.signInWithCredential(credential).then((value) {
      if(value.user != null){
        callNextReplacement( const Main_screen(), context);
      }else{if (kDebugMode) {
        print("6546");
      }}
    });
  }

}
