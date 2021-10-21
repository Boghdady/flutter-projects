import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluter_upload_image_api/pages/upload_multiple_and_single_img_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:progress_dialog/progress_dialog.dart';
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProgressDialog pr;
  String _name;

  File _image;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
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
      key: _scaffoldstate,
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
                              backgroundImage: _image == null
                                  ? NetworkImage(
                                      'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png')
                                  : FileImage(_image),
                              radius: 50.0,
                            ),
                            InkWell(
                              onTap: () {
                                _onAlertPress(context);
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
                        Text('Half Body',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
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
                          Center(
                            child: Container(
                              width: 300,
                              margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue),
                              child: FlatButton(
                                child: FittedBox(
                                    child: Text(
                                  'Go To Upload Multiple Files',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              UploadMultipleAndSingleImagePage()));
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
  void _onAlertPress(BuildContext context) async {
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
                  getGalleryImage(context);
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
                  getCameraImage(context);
                },
              ),
            ],
          );
        });
  }

  // ================================= Image from camera
  Future getCameraImage(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      Navigator.pop(context);
    });
  }

  //============================== Image from gallery
  Future getGalleryImage(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      Navigator.pop(context);
    });
  }

  //============================================================= API Area to upload image
  // Methode for file upload
  void _upload(File file) async {
    String fileName = file.path.split('/').last;
    print(fileName);

    FormData formData = FormData.fromMap({
      "name": _name,
      "photo": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();
    pr.show();
    var token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVkY2ViMjFjZjZmZTFjMDM5OGUzOGYyZiIsImlhdCI6MTU4NTg2MDExOCwiZXhwIjoxNTkzNjM2MTE4fQ.7EBfni8aoY4B6Q5Glgg1EpwAfeCnRDPdY6A4hkzyt-w';
//    dio.options.headers["Authorization"] = "Bearer " + token;
    try {
      Response response =
          await dio.patch("http://10.0.2.2:3000/api/v1/users/updateMe",
              data: formData,
              options: Options(
                contentType: Headers.formUrlEncodedContentType,
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ));
      print(response.data);
      setState(() {
        pr.hide();
      });
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
    if (_image != null || _name != '') {
//      await _uploadFile(_image);
      _upload(_image);
    }
  }

//  Future<void> _uploadFile(file) async {
//    // Get base file name
//    String fileName = basename(file.path);
//
//    try {
//      FormData formData = new FormData.fromMap({
//        "name": _name,
//        "photo": await MultipartFile.fromFile(file.path, filename: fileName),
//      });
//
//      Response response = await Dio().patch(
//          "http://10.0.2.2:3000/api/v1/users/updateMe",
//          data: formData,
//          options: Options(contentType: Headers.formUrlEncodedContentType));
//      print("File upload response: $response");
//
//      // Show the incoming message in snakbar
//
//    } catch (e) {
//      print("Exception Caught: $e");
//    }
//  }
}
