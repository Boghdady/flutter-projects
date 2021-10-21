import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/dev-data/users.dart';
import 'package:flutterdatingapp/features/discover/presentation/widgets/user_details/image_carousel.dart';
import 'package:flutterdatingapp/features/discover/presentation/widgets/user_details/images_preview.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';

class UserDetailsPage extends StatefulWidget {
  final String userId;
  UserDetailsPage({Key key, this.userId}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  int photoIndex = 0;
  List<String> userPhotos;
  String userPhoto;

  @override
  void initState() {
    super.initState();
    // TODO: Call get user by id here from api
    final user = users[int.parse(widget.userId) - 1];
    userPhotos = user["imags"];
    userPhoto = user["imgUrl"];

    print('user id : ${widget.userId}');
  }

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < userPhotos.length - 1 ? photoIndex + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: _buildMovementRightAndLeft,
              onTap: _showImage,
              child:
                  ImageCarousel(userPhotos: userPhotos, photoIndex: photoIndex),
            ),
            Row(
              children: [
                _buildNumberOfPhotos(context),
                _buildHorizontalListView(),
              ],
            ),
            _buildNameAndCountryAndLanguage(),
            _buildAboutMe(),
            UIHelper.verticalSpaceSmall,
            _buildVisitedCountries(),
            UIHelper.verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  Widget _buildNumberOfPhotos(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          UIHelper.verticalSpaceSmall,
          Text(
            "3",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            "Photos",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalListView() {
    return Expanded(
      child: Container(
        height: 80,
        color: Colors.white,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: userPhotos.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                width: 80,
                fit: BoxFit.cover,
                imageUrl: userPhotos[index],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey,
                    child: Container(),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              );
            }),
      ),
    );
  }

  void _buildMovementRightAndLeft(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
      _previousImage();
    } else if (details.velocity.pixelsPerSecond.dx < 0) {
      _nextImage();
    }
  }

  void _showImage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagesPreview(
          photos: userPhotos[photoIndex],
        ),
      ),
    );
  }

  Widget _buildNameAndCountryAndLanguage() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Name",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                ", 26",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.add_location,
                color: Colors.grey,
                size: 24,
              ),
              UIHelper.horizontalSpaceXSmall,
              Text(
                "Location",
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.chat,
                color: Colors.grey,
                size: 24,
              ),
              UIHelper.horizontalSpaceXSmall,
              Text(
                "Arabic, English",
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutMe() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 8, bottom: 8.0),
            child:
                Text("About Me", style: Theme.of(context).textTheme.headline3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "I'm jasic i love travelling, sport, music,"
            " and visited others countries. so other"
            " friends say everything is good.",
            maxLines: 3,
            style: TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget _buildVisitedCountries() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 8, bottom: 8.0),
            child: Text("Visited Countries",
                style: Theme.of(context).textTheme.headline3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // TODO : Use here horizontal listView
              CircleAvatar(
                radius: 32.0,
                backgroundImage: NetworkImage(""),
              )
            ],
          ),
        )
      ],
    );
  }
}
