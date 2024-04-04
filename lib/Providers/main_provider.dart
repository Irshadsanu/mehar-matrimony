import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:meher_nikkah/constants/my_colors.dart';
import '../constants/Strings.dart';
import '../models/SkinColorModel.dart';
import '../models/checkbox_model.dart';
import '../models/deleteModel.dart';
import '../update.dart';

class MainProvider extends ChangeNotifier{

  final DatabaseReference mRootReference = FirebaseDatabase.instance.ref();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");


  TextEditingController relationTC = TextEditingController();
  TextEditingController firstNameTC = TextEditingController();
  TextEditingController lastNameTC = TextEditingController();
  TextEditingController mobileNoTC = TextEditingController();
  TextEditingController genderTC = TextEditingController();
  TextEditingController dobTC = TextEditingController();
  TextEditingController familyNameTC = TextEditingController();
  TextEditingController fatherNameTC = TextEditingController();
  TextEditingController religionTC = TextEditingController();
  TextEditingController nationalityTC = TextEditingController();
  TextEditingController emailIdTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  TextEditingController heightTC = TextEditingController();
  TextEditingController weightTC = TextEditingController();
  TextEditingController complexionTC = TextEditingController();
  TextEditingController bodyTypeTC = TextEditingController();
  TextEditingController physicallyChallengedTC = TextEditingController();
  TextEditingController highestEducationTC = TextEditingController();
  TextEditingController professionTC = TextEditingController();
  TextEditingController homeCountryTC = TextEditingController();
  TextEditingController homeStateTC = TextEditingController();
  TextEditingController presentCountryTC = TextEditingController();
  TextEditingController presentStateTC = TextEditingController();
  TextEditingController presentCityTC = TextEditingController();
  TextEditingController communityTC = TextEditingController();
  TextEditingController profileDescriptionTC = TextEditingController();
  TextEditingController hobbiesTC = TextEditingController();
  TextEditingController brothersTC = TextEditingController();
  TextEditingController sistersTC = TextEditingController();
  TextEditingController marriedBrothersTC = TextEditingController();
  TextEditingController marriedSistersTC = TextEditingController();
  TextEditingController ageTC = TextEditingController();


  /// upload photos
  bool imageSelected = false;
  List<DeleteModel> fileImageListFecth = [];
  int imageSet = 0;
  File? fileimageImage;
  List<File> fileImageList = [];




  File? fileimage;

   var outputDayNode = DateFormat('d/MM/yyy');
   DateTime birthDate = DateTime.now();
   final ImagePicker picker = ImagePicker();
   String userImgUrl = '';
   List<CheckBoxModel> maritialstatusList=[];

  List<String> relation =["Myself","Brother","Sister","Friend"];
  List<String> gender = ["Male","Female","Other"];
  List<String> organisationList = ["SUNNI GENERAL","SHIA","SUNNI(EK)","SUNNI(AP)","MUJAHID(KNM)","MUJAHID(WISDOM)","JAMAHATH ISLAMI","TABLEEQUE"];
  List<String> nationalityList = ["Indian","American","British",];
  List<SkinColorModel> complexionList = [];
  List<String> bodyTypeList = ["FAT","SLIM","MEDIUM",];
  List<String> educationList = ["MBBS","BTECH","BA","BCOM","BSE","MSE"];
  List<String> professionList = ["DOCTOR","ENGINEER","TEACHER","POLICE","ACCOUNTANT","ARCHITECT","LAWYER"];
  List<String> stateList = ["KERALA","TAMIL NADU"];
  List<String> disabilityList = ["Normal","Blindness","Deaf","Walking Disability","Mental Illness","Autism Spectrum Disorder","Speech and Language Disability"];

  List<String> Status= ["Live","Late"];
  String statusFather= "";
  String statusMother= "";

  ///fetchUserprofile
  String name="";
  String age="";
  String height="";
  String weight="";
  String profession="";
  String maritalStatus="";
  String highestQualification="";
  String country="";
  String state="";
  String city="";
  String community="";
  String nationality="";
  String disability="";
  String bodyType="";
  String complexion="";
  String familyName="";
  String fatherName="";
  String hobbies="";
  String description="";

   MainProvider(){
     addMaritalStatusList();
     addComplexion();
  }

   void dateSetting(DateTime birthDate) {
     dobTC.text = outputDayNode.format(birthDate).toString();
   }

  Future<void> selectDOB(BuildContext context) async {
    dobTC.text = "";
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != birthDate) {
      birthDate = pickedDate;
      dateSetting(birthDate);
      DateTime dateNow = DateTime.now();
      int k = dateNow.difference(birthDate).inDays ~/ 365;
      age = k.toString();
    }
    notifyListeners();
  }

   void showBottomSheet(BuildContext context) {
     showModalBottomSheet(
         elevation: 10,
         backgroundColor: Colors.white,
         shape: const RoundedRectangleBorder(
             borderRadius: BorderRadius.only(
               topLeft: Radius.circular(10.0),
               topRight: Radius.circular(10.0),
             )),
         context: context,
         builder: (BuildContext bc) {
           return Wrap(
             children: <Widget>[
               ListTile(
                   leading: const Icon(
                     Icons.camera_enhance_sharp,
                     color: my_violet,
                   ),
                   title: const Text(
                     'Camera',
                   ),
                   onTap: () => {imageFromCamera(), Navigator.pop(context)}),
               ListTile(
                   leading: const Icon(Icons.photo, color: my_violet),
                   title: const Text(
                     'Gallery',
                   ),
                   onTap: () => {imageFromGallery(), Navigator.pop(context)}),
             ],
           );
         });
     // ImageSource
   }

  void fileImageChange(File image) {
    fileimageImage = image;
    notifyListeners();
  }
  void imageChange(int image) {
    imageSet = image;
    notifyListeners();
  }




  Future<void> retrieveLostData() async {
     final LostDataResponse response = await picker.retrieveLostData();
     if (response.isEmpty) {
       return;
     }
     if (response.file != null) {
       fileimage = File(response.file!.path);

       notifyListeners();
     }
   }


   imageFromCamera() async {
     final pickedFile =
     await picker.pickImage(source: ImageSource.camera, imageQuality: 15);

     if (pickedFile != null) {
       // fileimage = File(pickedFile.path);
       _cropImage(pickedFile.path, '');
     } else {}
     if (pickedFile!.path.isEmpty) retrieveLostData();

     notifyListeners();
   }

   imageFromGallery() async {
     final pickedFile =
     await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
     if (pickedFile != null) {
       // fileimage = File(pickedFile.path);
       _cropImage(pickedFile.path, '');
     } else {}
     if (pickedFile!.path.isEmpty) retrieveLostData();

     notifyListeners();
   }


   Future<void> _cropImage(String path, String from) async {
     final croppedFile = await ImageCropper().cropImage(
       sourcePath: path,
       aspectRatioPresets: Platform.isAndroid
           ? [
         CropAspectRatioPreset.square,
         CropAspectRatioPreset.ratio3x2,
         CropAspectRatioPreset.original,
         CropAspectRatioPreset.ratio4x3,
         CropAspectRatioPreset.ratio16x9,
       ]
           : [
         CropAspectRatioPreset.original,
         CropAspectRatioPreset.square,
         CropAspectRatioPreset.ratio3x2,
         CropAspectRatioPreset.ratio4x3,
         CropAspectRatioPreset.ratio5x3,
         CropAspectRatioPreset.ratio5x4,
         CropAspectRatioPreset.ratio7x5,
         CropAspectRatioPreset.ratio16x9,
         CropAspectRatioPreset.ratio16x9
       ],
       uiSettings: [
         AndroidUiSettings(
             toolbarTitle: 'Cropper',
             toolbarColor: Colors.black,
             toolbarWidgetColor: Colors.white,
             initAspectRatio: CropAspectRatioPreset.original,
             lockAspectRatio: false),
         IOSUiSettings(
           title: 'Cropper',
         )
       ],
     );
     if (croppedFile != null) {
       fileimageImage = File(croppedFile.path);
       fileImageList.add(fileimageImage!);

       if (from == 'edit') {
         fileImageListFecth.add(DeleteModel('', '', fileimageImage!, "File"));
       }


       notifyListeners();
     }
     print("gggggggggggg666" + fileimageImage.toString());
   }


   void clearUploadImages(){

     fileimageImage = null;
     fileImageList.clear();
     fileImageListFecth.clear();
     notifyListeners();
   }


   void addMaritalStatusList(){
     maritialstatusList.add(CheckBoxModel("Never Married",false));
     maritialstatusList.add(CheckBoxModel("Divorced",false));
     maritialstatusList.add(CheckBoxModel("Awaiting Divorce",false));
     maritialstatusList.add(CheckBoxModel("Widowed/Widower",false));
     maritialstatusList.add(CheckBoxModel("Nikkah Divorce",false));
     notifyListeners();
   }

   void selectMaritalStatusFun(int index,String name){
     if(maritialstatusList[index].value==true){
       maritialstatusList[index].value=false;
     }else{
       maritialstatusList[index].value=true;
     }
     for(var element in maritialstatusList){
       if(element.name!=name){
         element.value=false;
       }
     }
     notifyListeners();
   }

   void addComplexion(){
     complexionList.add(SkinColorModel(RUSSET,"RUSSET"),);
     complexionList.add(SkinColorModel(PERU,"PERU"),);
     complexionList.add(SkinColorModel(FAWN,"FAWN"),);
     complexionList.add(SkinColorModel(MELLOW_APRICOT,"MELLOW_APRICOT"),);
     complexionList.add(SkinColorModel(NAVAJO_WHITE,"NAVAJO_WHITE"),);
     notifyListeners();
   }

  radiogroup(int index) {
    statusFather = Status[index].toString();
    print("mkmkl" + statusFather);
    statusMother = Status[index].toString();
  }


 String uId = "";
   void registerUser(){
     DateTime now = DateTime.now();
     String userId = now.millisecondsSinceEpoch.toString();

     uId = userId;

     HashMap<String, Object> userMap = HashMap();
     userMap["NAME"] = firstNameTC.text.toString();
     userMap["PHONE"] = "+91${mobileNoTC.text}";
     userMap["REGISTRATION TIME"] = DateTime.now();
     userMap["REGISTRATION TIME MILLIS"] = DateTime.now().millisecondsSinceEpoch.toString();

     // map["LAST LOGIN TIME"] = DateTime.now();

     db.collection("USER").doc(userId).set(userMap);
     notifyListeners();
   }

   Future<void> profileRegistration() async {
       print(fileImageList.length.toString()+"nvnnvn");
       print(fileImageList.toString()+"cmjcjfj");
     String profileId = DateTime.now().millisecondsSinceEpoch.toString();
       HashMap<String, Object> profileMap = HashMap();
     HashMap<String, Object> imageMap = HashMap();


       profileMap["OWNER ID"] = uId;
       profileMap["RELATION"] = relationTC.text.toString();
       profileMap["FIRST NAME"] = firstNameTC.text.toString();
       profileMap["LAST NAME"] = lastNameTC.text.toString();
       profileMap["FAMILY NAME"] = familyNameTC.text.toString();
       profileMap["GENDER"] = genderTC.text.toString();
       profileMap["MOBILE"] = "+91${mobileNoTC.text}";
       profileMap["DOB"] = birthDate;
       profileMap["EMAIL"] = emailIdTC.text.toString();
       profileMap["HEIGHT"] = int.parse(heightTC.text.toString());
       profileMap["WEIGHT"] = int.parse(weightTC.text.toString());
       profileMap["ORGANISATION"] = communityTC.text.toString();

       for (var element in maritialstatusList) {
         if(element.value=true) {
           print(element.name.toString()+"ertyuyhgfds");
           profileMap["MARRIAGE STATUS"] = element.name;
         }
         print(element.name.toString()+"kjnhbgvfcdxszzzzzzz");
       }
       profileMap["COMPLEXION"] = complexionTC.text.toString();
       profileMap["BODY TYPE"] = bodyTypeTC.text.toString();
       profileMap["DISABILITY"] = physicallyChallengedTC.text.toString();
       profileMap["EDUCATION"] = highestEducationTC.text.toString();
       profileMap["PROFESSION"] = professionTC.text.toString();
       profileMap["NATIONALITY"] = nationalityTC.text.toString();
       profileMap["CREATED TIME"] = DateTime.now();
       profileMap["STATE"] = presentStateTC.text.toString();
       profileMap["RESIDENT COUNTRY"] = presentCountryTC.text.toString();
       profileMap["RESIDENT STATE"] = presentStateTC.text.toString();
       profileMap["RESIDENT CITY"] = presentCityTC.text.toString();
       profileMap["DESCRIPTION"] = profileDescriptionTC.text.toString();

       profileMap["HOBBIES"] = hobbiesTC.text.toString();
       profileMap["FATHER STATUS"] = statusFather;
       profileMap["MOTHER STATUS"] = statusMother;
       profileMap["BROTHERS"] = brothersTC.text.toString();
       profileMap["MARRIED BROTHERS"] = marriedBrothersTC.text.toString();
       profileMap["MARRIED SISTERS"] = marriedSistersTC.text.toString();
       profileMap["SISTERS"] = sistersTC.text.toString();

       print(fileImageList.length.toString()+"fhgggggfhhjd");
       print(fileImageList.toString()+"dhujhdej");
     if (!kIsWeb) {
       if (fileImageList.isNotEmpty) {
         int k = 0;
         for (File i in fileImageList) {
           k++;
           String imgKey = "Image" + k.toString();
           String time = DateTime.now().millisecondsSinceEpoch.toString();
           ref = firebase_storage.FirebaseStorage.instance.ref().child(time);
           await ref.putFile(i).whenComplete(() async {
             await ref.getDownloadURL().then((value) async {
               imageMap[imgKey] = value;
             });
           });
         }
       }
       profileMap["IMAGE_CONTENT"] = imageMap;
     }


       db.collection("PROFILES").doc(profileId).set(profileMap);
       notifyListeners();
       fetchProfileDetails(profileId);
       notifyListeners();
       ///usersnode
     HashMap<String, Object> userMap = HashMap();
     userMap["PROFILE ID"] = profileId;
     db.collection("USER").doc(uId).update(userMap);
     }

     void clearRegistration(){
       relationTC.clear();
       firstNameTC.clear();
       lastNameTC.clear();
       mobileNoTC.clear();
       genderTC.clear();
       dobTC.clear();
       familyNameTC.clear();
       fatherNameTC.clear();
       nationalityTC.clear();
       emailIdTC.clear();
       passwordTC.clear();
       heightTC.clear();
       weightTC.clear();
       complexionTC.clear();
       bodyTypeTC.clear();
       physicallyChallengedTC.clear();
       highestEducationTC.clear();
       professionTC.clear();
       homeCountryTC.clear();
       homeStateTC.clear();
       presentCountryTC.clear();
       presentStateTC.clear();
       presentCityTC.clear();
       communityTC.clear();
       hobbiesTC.clear();
       brothersTC.clear();
       marriedBrothersTC.clear();
       sistersTC.clear();
       marriedSistersTC.clear();
       profileDescriptionTC.clear();
       statusMother="";
       statusFather="";

     }

  void lockApp() {
    mRootReference.child("0").onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> map = event.snapshot.value as Map;
        List<String> versions = map['APPVERSION'].toString().split(',');
        if (!versions.contains(appVersion)) {
          String address = map['ADDRESS'].toString();
          String button = map['BUTTON'].toString();
          String text = map['TEXT'].toString();
          runApp(MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Update(
              address: address,
              button: button,
              text: text,
            ),
          ));
        }
      }
    });
  }


  void fetchProfileDetails(String profileId){
      db.collection("PROFILES").doc(profileId).get().then((value) {
        if (value.exists) {
          Map<dynamic, dynamic> map = value.data() as Map;
          name = map["FIRST NAME"].toString() +""+ map["LAST NAME"].toString();
          age = age;
          height = map["HEIGHT"].toString();
          weight = map["WEIGHT"].toString();
          profession = map["PROFESSION"].toString();
          maritalStatus = map["MARRIAGE STATUS"].toString();
          highestQualification = map["EDUCATION"].toString();
          country = map["RESIDENT COUNTRY"].toString();
          state = map["RESIDENT STATE"].toString();
          city = map["RESIDENT CITY"].toString();
          community = map["ORGANISATION"].toString();
          nationality = map["NATIONALITY"].toString();
          disability = map["DISABILITY"].toString();
          bodyType = map["BODY TYPE"].toString();
          complexion = map["COMPLEXION"].toString();
          familyName = map["FAMILY NAME"].toString();
          hobbies = map["HOBBIES"].toString();
          description = map["DESCRIPTION"].toString();
          fileImageListFecth.clear();
          if (map['IMAGE_CONTENT'] != "") {
            map["IMAGE_CONTENT"].forEach((key,value) {
            fileImageListFecth.add(DeleteModel("", key, value.toString(), "File"));
            notifyListeners();
            });
          }
        }
      });
      notifyListeners();
  }


}