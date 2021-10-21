import 'package:flutter/material.dart';
import 'package:flutterdatingapp/features/discover/presentation/pages/user_details_page.dart';
import 'package:photo_view/photo_view.dart';

class ImagesPreview extends StatelessWidget {
  final String photos;

  ImagesPreview({Key key, @required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySecondScreen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('MySecondScreen'),
          centerTitle: true,
        ),
        body: GestureDetector(
            child: PhotoView(
              imageProvider: NetworkImage(photos),
              backgroundDecoration: BoxDecoration(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => UserDetailsPage()));
            }),
      ),
    );
  }
}
