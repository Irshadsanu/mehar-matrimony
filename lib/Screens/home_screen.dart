import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meher_nikkah/Screens/registration_screen.dart';
import 'package:meher_nikkah/Screens/Page_slider_screen.dart';
import 'package:meher_nikkah/constants/my_colors.dart';
import 'package:meher_nikkah/constants/my_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget{
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final images = ["assets/background1.jpeg","assets/background2.jpeg"];
  int activeIndex = 0;


  void initState() {
    // TODO: implement initState 
    super.initState();
    Timer(Duration(seconds: 5), () {
      callNextReplacement(RegistrationScreen(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: my_violet,
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = images[index];
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height*0.8,
              viewportFraction: 1,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height*0.8,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage("assets/background1.jpeg"),
          //         fit: BoxFit.fill
          //           )),
          //
          //   // child: Column(
          //   //   children: [
          //   //     // SizedBox(height: 600,),
          //   //     // Container(
          //   //     //         width: MediaQuery.of(context).size.width,
          //   //     //         height: 150,
          //   //     //         decoration: const BoxDecoration(
          //   //     //         boxShadow: [BoxShadow(blurRadius: 30,
          //   //     //         color: Colors.black12,
          //   //     //        spreadRadius: 30,
          //   //     //         offset: Offset(20, 20))],
          //   //     //         gradient: LinearGradient(
          //   //     //         begin: Alignment.topRight,
          //   //     //         end: Alignment.bottomRight,
          //   //     //         colors: [Color(0XFF493058), Colors.black],
          //   //     //       ),
          //   //     //    ),
          //   //     //   child: const Align(
          //   //     //     alignment: Alignment.bottomCenter,
          //   //     //     child: Text("   TALK TO 100% \n\nVERIFIED PROFILES",
          //   //     //         style: TextStyle(
          //   //     //             fontWeight: FontWeight.w900,
          //   //     //             height: 0,
          //   //     //             fontSize: 25,
          //   //     //             color: Colors.white)),
          //   //     //   ),
          //   //     // ),
          //   //   ],
          //   // ),
          // ),

           Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Image.asset("assets/matrimonylogo.png",scale: 12,color: my_white,),
                ),
                Text("MEHER NIKKAH",
                  style: TextStyle(
                      color: my_white.withOpacity(0.5),
                      fontSize: 26,
                      ),),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height:  MediaQuery.of(context).size.height*0.45,
              width:  MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.06),
                    Colors.black.withOpacity(0.7),
                    Colors.black,
                    Colors.black,
                    my_violet,
                  ],
                ),
              ),

            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height:  MediaQuery.of(context).size.height*0.4,
              width:  MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [ Colors.black.withOpacity(0.03), Colors.black.withOpacity(0.09),my_violet,],
                ),
              ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children:  [
                   buildIndicator(),
                   SizedBox(
                     height:MediaQuery.of(context).size.height- MediaQuery.of(context).size.height*0.8,
                       child:  Center(
                           child: InkWell(
                             onTap: (){
                               callNext(RegistrationScreen(), context);
                             },
                             child: const Text(" TALK TO 100% \nVERIFIED PROFILES",
                         style: TextStyle(
                               color: my_white,
                               fontSize: 26,
                               fontWeight: FontWeight.bold
                         ),textAlign: TextAlign.center,
                       ),
                           ))),
                 ],
               ),
            ),
          ),

        ],
      ),
    );
  }

   Widget buildImage(String image, int index) => Container(
     width: MediaQuery.of(context).size.width,
     child: Image.asset(
       image,
       fit: BoxFit.fill,
     ),
   );
  Widget buildIndicator() => AnimatedSmoothIndicator(
      effect: const ExpandingDotsEffect(
          expansionFactor: 2,
          spacing: 4,
          dotHeight: 6,
          dotWidth: 12,
          dotColor: Colors.white,
          activeDotColor: Color(0xff46255C)),
      activeIndex: activeIndex,
      count: images.length);
}