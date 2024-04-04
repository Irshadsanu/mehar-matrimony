import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants/my_colors.dart';
import 'constants/my_text.dart';

class Update extends StatelessWidget {
  String text;
  String button;
  String address;
  Update({Key? key,required this.text,required this.button,required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:  const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    my_violet,my_black,
                  ]
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                margin: const EdgeInsets.only(bottom: 20),

                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/matrimonylogo.png"),

                    scale: 1,
                    fit: BoxFit.fitHeight,
                  ),
                ),

              ),
              Container(
                alignment: Alignment.center,
                child: const Text('MEHER NIKKAH',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(text,style: whitePoppinsBoldM18,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: (){
                    _launchURL(address);
                  },
                  child: Container(
                    height: 40,
                    width: 150,

                    decoration: BoxDecoration(
                      color: my_violet,
                        // gradient: const LinearGradient(
                        //     colors: [
                        //       my_violet,my_black,
                        //     ]
                        // ),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,),
                            child: Text(button,style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: my_white,
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Image.asset("assets/Logo_theme_letters.png",scale:4),
        //     ],
        //   ),
        // ),


      ),
    );

  }
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
