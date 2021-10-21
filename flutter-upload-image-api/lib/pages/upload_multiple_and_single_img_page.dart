import 'dart:io';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:fluter_upload_image_api/utils/exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

class UploadMultipleAndSingleImagePage extends StatefulWidget {
  @override
  _UploadMultipleAndSingleImagePageState createState() =>
      _UploadMultipleAndSingleImagePageState();
}

class _UploadMultipleAndSingleImagePageState
    extends State<UploadMultipleAndSingleImagePage> {
  ProgressDialog pr;
  String _name;

  File _profileImage;
  File _image1;
  File _image2;
  File _image3;
  var name = TextEditingController();

  String img =
      'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //============================================= loading dialoge
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    pr.style(
      message: 'Please wait...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Personal Info'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              right: 10,
              left: 10,
              top: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Add Profile Picture and your Personal Details',
                    style: Theme.of(context).textTheme.title,
                  ),
                  //======================================================================================== Circle Avatar
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: _profileImage == null
                                  ? NetworkImage(
                                      'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png')
                                  : FileImage(_profileImage),
                              radius: 50.0,
                            ),
                            InkWell(
                              onTap: () {
                                _onAlertPress(context, _profileImage);
                              },
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      color: Colors.black),
                                  margin: EdgeInsets.only(left: 70, top: 70),
                                  child: Icon(
                                    Icons.photo_camera,
                                    size: 25,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                        Text('Profile Image',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: _image1 == null
                                      ? NetworkImage(
                                          'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png')
                                      : FileImage(_image1),
                                  radius: 50.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    _onAlertPress(context, _image1);
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          color: Colors.black),
                                      margin:
                                          EdgeInsets.only(left: 70, top: 70),
                                      child: Icon(
                                        Icons.photo_camera,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                            Text('Image1',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: _image2 == null
                                      ? NetworkImage(
                                          'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png')
                                      : FileImage(_image2),
                                  radius: 50.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    _onAlertPress(context, _image2);
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          color: Colors.black),
                                      margin:
                                          EdgeInsets.only(left: 70, top: 70),
                                      child: Icon(
                                        Icons.photo_camera,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                            Text('Image2',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: _image3 == null
                                      ? NetworkImage(
                                          'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png')
                                      : FileImage(_image3),
                                  radius: 50.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    _onAlertPress(context, _image3);
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          color: Colors.black),
                                      margin:
                                          EdgeInsets.only(left: 70, top: 70),
                                      child: Icon(
                                        Icons.photo_camera,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                            Text('Image3',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
//=========================================================================================== Form
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 100),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: name,
                            onChanged: ((String name) {
                              setState(() {
                                _name = name;
                                print(_name);
                              });
                            }),
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            },
                          ),

                          //========================================================Button

                          Center(
                            child: Container(
                              width: 300,
                              margin: EdgeInsets.only(top: 50),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue),
                              child: FlatButton(
                                child: FittedBox(
                                    child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                )),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _startUploading();
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
//============================================================================================================= Form Finished
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //========================================================================== Funcions Area

  //========================= Gellary / Camera AlerBox
  void _onAlertPress(BuildContext context, File image) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text('Gallery'),
                  ],
                ),
                onPressed: () {
                  getGalleryImage(context, image);
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.camera,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text('Take Photo'),
                  ],
                ),
                onPressed: () {
                  getCameraImage(context, image);
                },
              ),
            ],
          );
        });
  }

  // ================================= Image from camera
  Future getCameraImage(BuildContext context, File image) async {
    var cameraImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image == _profileImage) {
        _profileImage = cameraImage;
      } else if (image == _image1) {
        _image1 = cameraImage;
      } else if (image == _image2) {
        _image2 = cameraImage;
      } else {
        _image3 = cameraImage;
      }
      Navigator.pop(context);
    });
  }

  //============================== Image from gallery
  Future getGalleryImage(BuildContext context, File image) async {
    var galleryImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image == _profileImage) {
        _profileImage = galleryImage;
      } else if (image == _image1) {
        _image1 = galleryImage;
      } else if (image == _image2) {
        _image2 = galleryImage;
      } else {
        _image3 = galleryImage;
      }

      Navigator.pop(context);
    });
  }

  //============================================================= API Area to upload image
  // Methode for file upload
  void _upload(File profileImage, File image1, File image2, File image3) async {
    String profileImageFileName = profileImage.path.split('/').last;
    String firstImageFileName = image1.path.split('/').last;
    String secondImageFileName = image2.path.split('/').last;
    String thirdImageFileName = image3.path.split('/').last;

    // ===================================================== Prepare FormData
    Future<FormData> formData() async {
      var formData = FormData();
      formData.fields..add(MapEntry("name", _name));
      formData.files.addAll([
        MapEntry(
          "imageCover",
          await MultipartFile.fromFile(profileImage.path,
              filename: profileImageFileName),
        ),
        MapEntry(
          "images",
          await MultipartFile.fromFile(image1.path,
              filename: firstImageFileName),
        ),
        MapEntry(
          "images",
          MultipartFile.fromFileSync(image2.path,
              filename: secondImageFileName),
        ),
        MapEntry(
          "images",
          MultipartFile.fromFileSync(image3.path, filename: thirdImageFileName),
        ),
      ]);
      return formData;
    }

    // ===================================================== Send request to server using dio
    Dio dio = new Dio();
    pr.show();
    var token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVjOGExZDViMDE5MGIyMTQzNjBkYzA1NyIsImlhdCI6MTU4NTk3MjI2NSwiZXhwIjoxNTkzNzQ4MjY1fQ.KtPYhS2r1nfxvmiEFlYPM61F1TcSKAImEmZoVH20l6U';
//    dio.options.headers["Authorization"] = "Bearer " + token;
    try {
      Response response = await dio.patch(
        "http://10.0.2.2:3000/api/v1/tours/5e876a32f18bb9e17fc62791",
        data: await formData(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.data);
      setState(() {
        pr.hide();
      });
//      var data = response.data['data'];

    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
        setState(() => pr.hide());
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
        setState(() => pr.hide());
      }
    }
  }

  void _startUploading() async {
    if (_image1 != null ||
        _image2 != null ||
        _image3 != null ||
        _profileImage != null ||
        _name != '') {
//      await _uploadFile(_image);
      _upload(_profileImage, _image1, _image2, _image3);
    }
  }
}
