import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meher_nikkah/Screens/profile_screen.dart';
import 'package:meher_nikkah/constants/my_functions.dart';
import 'package:provider/provider.dart';

import '../Providers/main_provider.dart';
import '../constants/my_colors.dart';
import 'Otp_Page.dart';

class PhotosUpload extends StatelessWidget {
  String from;

  PhotosUpload({
    Key? key,
    required this.from,
  }) : super(key: key);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body:
      Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .16,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: my_violet,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 50),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 60),
                  child: Text(
                    "Upload Photos",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
                "Upload 3 or more photos that display \n          your full face in good light",
                style: TextStyle(color: Colors.black54)),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * .65,
          //   child: Consumer<MainProvider>(builder: (context, value, child) {
          //     return Consumer<MainProvider>(
          //         builder: (context, value, child) {
          //       return
          //           // value.imageSelected?
          //           Padding(
          //             padding: const EdgeInsets.only(left: 15,right: 15),
          //             child: SingleChildScrollView(
          //               scrollDirection: Axis.horizontal,
          //               child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   // crossAxisAlignment: CrossAxisAlignment.center,
          //                   children: [
          //                     buildGalleryPhotos(context),
          //
          //               ]),
          //             ),
          //           );
          //     });
          //   }),
          // ),
          SizedBox(height:  MediaQuery.of(context).size.height * .12,),


          Consumer<MainProvider>(
            builder: (context,value,child) {
              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: <Widget>[

                    SizedBox(

                      // width: MediaQuery.of(context).size.width ,
                      height: 150,
                      child: value.fileImageListFecth.length != 0
                          ? ListView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: value.fileImageListFecth.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                mainProvider.imageChange(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  10,
                                  0,
                                  0,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                          const BorderRadius.all(Radius.circular(5))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(5)),
                                              image: DecorationImage(
                                                // image:value.fileimagelist.length>1?FileImage(value.fileimagelist[1]!):AssetImage("Assets/upload_imageBig.png") as ImageProvider,

                                                image: value.fileImageListFecth
                                                    .isNotEmpty &&
                                                    value.fileImageListFecth[index]
                                                        .fileType ==
                                                        'String'
                                                    ? NetworkImage(value
                                                    .fileImageListFecth[index].image)
                                                    : value.fileImageListFecth[index]
                                                    .fileType ==
                                                    'File'
                                                    ? FileImage(value
                                                    .fileImageListFecth[index]
                                                    .image!)
                                                    : const AssetImage(
                                                    "Assets/upload_imageBig.png")
                                                as ImageProvider,
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      ),
                                    ),
                                    from == 'edit'
                                        ? InkWell(
                                      onTap: () {
                                        // DeleteAlert(context,value.imageSet);
                                      },
                                      child: const Positioned(
                                          left: 3,
                                          top: 10,
                                          child: Icon(
                                            Icons.delete_forever_sharp,
                                            size: 13,
                                            color: Colors.red,
                                          )),
                                    )
                                        : SizedBox(),
                                    // SizedBox(width: 10,)
                                  ],
                                ),
                              ),
                            );
                          })
                          : ListView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: value.fileImageList.length,
                          // gridDelegate:
                          // const SliverGridDelegateWithFixedCrossAxisCount(
                          //     childAspectRatio: 1.13,
                          //     crossAxisSpacing: 2,
                          //     crossAxisCount: 1),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                mainProvider.fileImageChange(value.fileImageList[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  3,
                                  10,
                                  0,
                                  0,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    height: 100,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        image: DecorationImage(
                                          // image:value.fileimagelist.length>1?FileImage(value.fileimagelist[1]!):AssetImage("Assets/upload_imageBig.png") as ImageProvider,

                                          image: value.fileImageList.isNotEmpty
                                              ? FileImage(value.fileImageList[index])
                                              : const AssetImage(
                                              "Assets/upload_imageBig.png")
                                          as ImageProvider,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: (){

                            mainProvider.showBottomSheet(context);

                          },
                          child: Padding(
                              padding:
                              const EdgeInsets.only(top: 20,),
                              child:Align(
                                alignment: Alignment.center,

                                child: Container(
                                  width: 70,
                                  height: 70.0,
                                  child: Image.asset(
                                    "assets/photoavatar.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              );
            }
          ),
          SizedBox(height:  MediaQuery.of(context).size.height * .22,),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return Container(
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width * .49,
                child: FloatingActionButton(
                  backgroundColor: my_violet,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    mainProvider.profileRegistration();
                    mainProvider.clearRegistration();
                    // mainProvider.fetchProfileDetails(profileId);
                    callNextReplacement(const Otp_Page(), context);
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        // Image.asset("assets/Link Icon.png", scale: 4.1),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Text(
                          "Upload",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }

  Widget buildGalleryPhotos(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    return Consumer<MainProvider>(builder: (context, value, child) {
      return

          Row(
            children: [


              SizedBox(

                // width: MediaQuery.of(context).size.width ,
                height: 150,
                child: value.fileImageListFecth.isNotEmpty
                    ? ListView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: value.fileImageListFecth.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          mainProvider.imageChange(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            10,
                            0,
                            0,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        image: DecorationImage(
                                          // image:value.fileimagelist.length>1?FileImage(value.fileimagelist[1]!):AssetImage("Assets/upload_imageBig.png") as ImageProvider,

                                          image: value.fileImageListFecth
                                              .isNotEmpty &&
                                              value.fileImageListFecth[index]
                                                  .fileType ==
                                                  'String'
                                              ? NetworkImage(value
                                              .fileImageListFecth[index].image)
                                              : value.fileImageListFecth[index]
                                              .fileType ==
                                              'File'
                                              ? FileImage(value
                                              .fileImageListFecth[index]
                                              .image!)
                                              : const AssetImage(
                                              "Assets/upload_imageBig.png")
                                          as ImageProvider,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                ),
                              ),
                              from == 'edit'
                                  ? InkWell(
                                onTap: () {
                                  // DeleteAlert(context,value.imageSet);
                                },
                                child: const Positioned(
                                    left: 3,
                                    top: 10,
                                    child: Icon(
                                      Icons.delete_forever_sharp,
                                      size: 13,
                                      color: Colors.red,
                                    )),
                              )
                                  : SizedBox(),
                              // SizedBox(width: 10,)
                            ],
                          ),
                        ),
                      );
                    })
                    : ListView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: value.fileImageList.length,
                    // gridDelegate:
                    // const SliverGridDelegateWithFixedCrossAxisCount(
                    //     childAspectRatio: 1.13,
                    //     crossAxisSpacing: 2,
                    //     crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          mainProvider.fileImageChange(value.fileImageList[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            3,
                            10,
                            0,
                            0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  image: DecorationImage(
                                    // image:value.fileimagelist.length>1?FileImage(value.fileimagelist[1]!):AssetImage("Assets/upload_imageBig.png") as ImageProvider,

                                    image: value.fileImageList.isNotEmpty
                                        ? FileImage(value.fileImageList[index])
                                        : const AssetImage(
                                        "Assets/upload_imageBig.png")
                                    as ImageProvider,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
    });
  }
}
