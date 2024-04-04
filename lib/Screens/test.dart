import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ProductCarousel extends StatefulWidget {
  @override
  _ProductCarouselState createState() => _ProductCarouselState();
}

class ImageConfig {
  String source;
  String path;

  ImageConfig({required this.source, required this.path});
}

class _ProductCarouselState extends State<ProductCarousel> {
  int pageIndex = 0;

  List<ImageConfig> imgList = [
    ImageConfig(
        source: "http",
        path:
        'https://cdn.pixabay.com/photo/2016/04/15/08/04/strawberries-1330459_960_720.jpg'),
    ImageConfig(
        source: "http",
        path:
        'https://cdn.pixabay.com/photo/2019/12/01/16/56/cookies-4665910_960_720.jpg'),
    ImageConfig(
        source: "http",
        path:
        'https://cdn.pixabay.com/photo/2017/05/23/22/36/vegetables-2338824_960_720.jpg')
  ];
  late List<Widget> imageSliders;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      //imgList.add(ImageConfig(source: "file", path: pickedFile.path));
      if (pageIndex == 0)
        imgList.add(ImageConfig(source: "file", path: pickedFile!.path));
      else
        imgList.insert(pageIndex + 1, ImageConfig(source: "file", path: pickedFile!.path));
    });
  }


  @override
  Widget build(BuildContext context) {
    imageSliders = imgList
        .map(
          (item) =>
          Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      item.source == "http"
                          ? Image.network(item.path,
                          fit: BoxFit.cover, width: 1000.0)
                          : Image.file(File(item.path),
                          fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
    )
        .toList();

    return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    pauseAutoPlayOnManualNavigate: true,
                    pauseAutoPlayOnTouch: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      pageIndex = index;
                    }
                ),
                items: imageSliders,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.tealAccent,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/photoavatar.png",
                          fit: BoxFit.fill,scale: 2,
                        ),                      ],
                    ),
                    onPressed: getImage,
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}