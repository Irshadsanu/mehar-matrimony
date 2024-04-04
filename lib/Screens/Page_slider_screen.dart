// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class uploadPhoto extends StatelessWidget {
//   const uploadPhoto({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(130),
//         child: AppBar(
//           elevation: 0,
//           toolbarHeight: 130,
//           backgroundColor: Color(0xff493058),
//           title: Column(
//             children: [
//               Container(
//                   margin: EdgeInsets.only(top: 15, right: 250),
//                   child: Icon(Icons.arrow_back)),
//               Container(
//                 margin: EdgeInsets.only(top: 30, left: 70),
//                 child: Text(
//                   'Upload Photo',
//                   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Container(
//         margin: EdgeInsets.only(top: 50, left: 32),
//         child: Column(
//           children: [
//             Container(
//               child: Text(
//                   'Upload 3 or more photos that display'
//                   '\n\n         your full face in good light.',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black26,
//                       height: 0)),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Stack(children: [
//               CircleAvatar(
//                 backgroundImage: AssetImage('assets/profile.png'),
//                 backgroundColor: Colors.black26,
//                 radius: 130,
//               ),
//               Container(
//                   margin: EdgeInsets.only(top: 220, left: 170),
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colors.white,
//                   )),
//               Container(
//                   margin: EdgeInsets.only(top: 222.5, left: 172),
//                   height: 55,
//                   width: 55,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: const Color(0xff493058),
//                   ),
//                   child: Icon(
//                     Icons.add,
//                     color: Colors.white30,
//                     size: 40,
//                   ))
//             ]),
//             SmoothPageIndicator(
//               // PageController
//               count: 3,
//               effect: WormEffect(activeDotColor: Color(0xff493058)),
//               // your preferred effect
//               onDotClicked: (index) {},
//               controller: PageController(),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 80),
//               child: MaterialButton(
//                 onPressed: () {},
//                 height: 45,
//                 elevation: 0,
//                 minWidth: 200,
//                 shape: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide(
//                       color: Color(0xff493058),
//                     )),
//                 color: Color(0xff493058),
//                 child: Text('Upload',
//                     style: TextStyle(
//                       height: 0,
//                       fontSize: 22,
//                       color: Colors.white,
//                     )),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:meher_nikkah/Screens/create_profile_screen.dart';
import 'package:meher_nikkah/Screens/education_and_career.dart';
import 'package:meher_nikkah/Screens/profile_screen.dart';
import 'package:meher_nikkah/Screens/registration_screen.dart';
import 'package:meher_nikkah/Screens/upload_photosScreen.dart';

import 'about_you_screen.dart';
import 'know_each_other_screen.dart';

class PageSliderScreen extends StatefulWidget {
  const PageSliderScreen({Key? key}) : super(key: key);

  @override
  State<PageSliderScreen> createState() => _PageSliderScreenState();
}

class _PageSliderScreenState extends State<PageSliderScreen> {
  final PageController _pageViewController = PageController(initialPage: 0);

  int _activePage = 0;
  final List<Widget> _pages = [
    // RegistrationScreen(),
    // KnowEachOtherScreen(),
    // AboutYouScreen(),
    // EducationAndCareer(),
    // CreateProfileScreen(),
    // PhotosUpload(from: ''),
    // Profile()
  ];

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();  // dispose the PageController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageViewController,
              onPageChanged: (int index){
                setState(() {
                  _activePage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index){
                return _pages[index];
              }
          ),
          //creating dots at bottom
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   height: 40,
          //   child: Container(
          //     color: Colors.black12,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: List<Widget>.generate(
          //           _Pages.length,
          //               (index) => Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 8),
          //             child: InkWell(
          //               onTap: () {
          //                 _pageViewController.animateToPage(index,
          //                     duration: const Duration(milliseconds: 300),
          //                     curve: Curves.easeIn);
          //               },
          //               child: CircleAvatar(
          //                 radius: 5,
          //                 // check if a dot is connected to the current page
          //                 // if true, give it a different color
          //                 backgroundColor: _activePage == index
          //                     ? Colors.greenAccent
          //                     : Colors.white30,
          //               ),
          //             ),
          //           )),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
