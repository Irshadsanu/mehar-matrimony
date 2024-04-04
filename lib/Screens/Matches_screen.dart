import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/my_functions.dart';
import 'Single_Profile.dart';

class matches_page extends StatelessWidget {
  const matches_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => callNext(SingleProfile(),context),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                        fit: BoxFit.fill),
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 450,
                width: 200,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                            width: 78,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(20))),
                                    backgroundColor:
                                    MaterialStatePropertyAll(Colors.white24)),
                                child: Row(
                                  children: const [
                                    Icon(Icons.close, size: 16),
                                    Text(
                                      "Ignore",
                                      style: TextStyle(fontSize: 10),
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 25,
                            width: 62,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(20))),
                                    backgroundColor:
                                    const MaterialStatePropertyAll(
                                        Colors.white24)),
                                child: Row(
                                  children: const [
                                    Icon(Icons.filter_none_sharp, size: 15),
                                    Text(
                                      " 4",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 180, top: 260),
                      child: Text(
                        "Fathima KP",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 125, bottom: 10),
                      child: Text(
                        "22 Years  |  152 cm | Teacher",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 35,
                          width: 110,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                elevation: MaterialStatePropertyAll(2.0),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20))),
                                backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.call_outlined,
                                  size: 18,
                                  color: Colors.blueAccent,
                                ),
                                Text(
                                  "CALL NOW",
                                  style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          width: 140,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  elevation: MaterialStatePropertyAll(2.0),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20))),
                                  backgroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                    color: Colors.pinkAccent[100],
                                  ),
                                  Text(
                                    "SEND INTEREST",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.pinkAccent[100]),
                                  )
                                ],
                              )),
                        ),
                        CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}