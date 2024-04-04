import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meher_nikkah/Providers/LoginProvider.dart';
import 'package:meher_nikkah/Screens/education_and_career.dart';
import 'package:meher_nikkah/Screens/profile_screen.dart';
import 'package:meher_nikkah/Screens/registration_screen.dart';
import 'package:meher_nikkah/Screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Providers/main_provider.dart';
import 'Screens/Single_Profile.dart';
import 'Screens/test.dart';
import 'Screens/upload_photosScreen.dart';
import 'Screens/Page_slider_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context)=>MainProvider()),
          ChangeNotifierProvider(create: (context)=>LoginProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MeherNikkah Matrimony',
        theme: ThemeData(
        primarySwatch: Colors.blue,
         ),
       home:  RegistrationScreen()
    ));
  }
}
