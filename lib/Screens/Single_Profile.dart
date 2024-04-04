import 'package:flutter/material.dart';


class SingleProfile extends StatelessWidget {
  const SingleProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var height = queryData.size.height;
    var width = queryData.size.width;
    return Scaffold(
      body: Container(
        width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:NetworkImage("https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                  fit: BoxFit.fill
          )),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width:78,
                      child: ElevatedButton(onPressed: (){},
                          style: ButtonStyle(shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStatePropertyAll(Colors.white24)),
                          child: Row(
                        children: const [
                          Icon(Icons.close,size: 15),
                          Text("Ignore" ,style: TextStyle(fontSize: 10),)
                        ],
                      )),
                    ),
                    SizedBox(
                      height: 20,
                      width:62,
                      child: ElevatedButton(onPressed: (){},
                          style: ButtonStyle(shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          backgroundColor: const MaterialStatePropertyAll(Colors.white24)),
                          child: Row(
                        children: const [
                          Icon(Icons.filter_none_sharp,size: 15),
                          Text(" 4" ,style: TextStyle(fontSize: 18),)
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                height:height/4,
                width: width,
                decoration:const BoxDecoration(color: Colors.white,borderRadius:
                BorderRadius.only(topRight:Radius.circular(40),
                    topLeft: Radius.circular(40))) ,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35,right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          SizedBox(
                            height: 25,
                            width:99,
                            child: ElevatedButton(onPressed: (){},
                                style: ButtonStyle(shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                    backgroundColor: const MaterialStatePropertyAll(Colors.black)),
                                child: Row(
                                  children: const [
                                    Icon(Icons.call,size: 15),
                                    Text(" Call Now" ,style: TextStyle(fontSize: 12),)
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 25,
                            width:123,
                            child: ElevatedButton(onPressed: (){},
                                style: ButtonStyle(shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                    backgroundColor: const MaterialStatePropertyAll(Colors.black)),
                                child: Row(
                                  children: const [
                                    Icon(Icons.favorite_border_outlined,size: 15),
                                    Text(" SEND INTEREST" ,style: TextStyle(fontSize: 10),)
                                  ],
                                )),
                          ),
                          const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.black,
                            child: Icon(Icons.star_border,size: 18,color: Colors.amber),
                          )
                        ],),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: const [
                            Text("Minha Mehr",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                          Text("(T6516X3)")
                          ],
                        ),
                      ),

                      const Text("Short film actor"),
                      const Text("25 yrs.5'6/167cm"),
                      const Text("Anakkayam,Majeri"),
                      const Text("Malappuram,Kerala")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
