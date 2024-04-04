import 'package:flutter/material.dart';
import 'package:meher_nikkah/Providers/main_provider.dart';
import 'package:meher_nikkah/Screens/profile_screen.dart';
import 'dart:async';

import 'package:meher_nikkah/constants/my_colors.dart';
import 'package:provider/provider.dart';

import '../constants/my_functions.dart';
import 'home_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);
    mainProvider.lockApp();

    Timer(Duration(seconds: 2), () {
      callNextReplacement(HomeScreen(), context);
    });
  }

  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [my_splash, my_black])
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/matrimonylogo.png",color: Colors.white,scale:8,),
                Container(
                  alignment: Alignment.center,
                  child: const Text('MEHER NIKKAH',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                      )),
                ),
              ],
            ),
          )
    );
  }
}
