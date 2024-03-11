
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:pet_care/session_manager.dart';
import 'package:pet_care/utill/function.dart';
class ProfileController with ChangeNotifier{
  DatabaseReference ref=FirebaseDatabase.instance.ref().child('User');
  firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;
  final picker=ImagePicker();
  XFile? _image;
  XFile? get image => _image ;
  bool _loading=false;
  bool get loading=> _loading;
  setloading(bool value)
  {
    _loading=value;
    notifyListeners();
  }
  Future pickGalleryImage(BuildContext context) async
  {
    final pickFile=await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);
    if(pickFile!=null)
      {
        _image=XFile(pickFile.path);
        uploadImage(context);
        setloading(false);
      }
  }
  Future pickCameraImage(BuildContext context) async
  {
    final pickFile=await picker.pickImage(source: ImageSource.camera,imageQuality: 100);
    if(pickFile!=null)
    {
      _image=XFile(pickFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  void pickImage(context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
          content: Container(
             height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: (){
                  pickCameraImage(context);
                  Navigator.pop(context);
                  },
                  leading: Icon(Icons.camera_alt_outlined,color: Colors.deepPurple[400],),
                  title: Text("Camera",style: TextStyle(color: Colors.deepPurple),) ,
                ),
                ListTile(
                  onTap: (){
                    pickGalleryImage(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.image,color: Colors.deepPurple[400],),
                  title: Text("Gallery",style: TextStyle(color: Colors.deepPurple),) ,
                )
              ],
            ),
            ),
          );
        }
    );
  }

  void uploadImage(BuildContext context) async{
    setloading(true);
    firebase_storage.Reference storef=firebase_storage.FirebaseStorage.instance.ref('/profileImage'+SessionController().userId.toString());
    firebase_storage.UploadTask uploadTask=storef.putFile(File(image!.path).absolute);
    await Future.value(uploadTask);
final newurl=await storef.getDownloadURL();
  ref.child(SessionController().userId.toString()).update({
    'profile' : newurl.toString()
  }).then((value){
    Func.toasstMassage('Profile updated successfully');
    setloading(false);
    _image=null;
  }).onError((error, stackTrace){
    Func.toasstMassage(error.toString());
    setloading(false);
  });



  }
}