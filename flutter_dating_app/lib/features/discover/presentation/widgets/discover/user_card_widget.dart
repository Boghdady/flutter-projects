import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/constants.dart';
import 'package:shimmer/shimmer.dart';

class UserCardWidget extends StatelessWidget {
  final user;

  const UserCardWidget({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, userDetailsPageRoute,
            arguments: UserDetailsPageArguments(id: user["id"]));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 2.0, top: 4.0, right: 2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                imageUrl: user["imgUrl"],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey,
                    child: UserCardWidget(),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
              buildOnlineDot(),
              buildCardFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardFooter() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black26,
              Colors.black26,
              Colors.black12,
              Colors.black12
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.only(right: 4.0, left: 4.0),
                child: AutoSizeText(
                  "${user["age"]}, ${user["name"]} ",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  // minFontSize: 10,
                  // maxFontSize: 12,
                ),
              ),
            ),
            // Flexible(
            //   child: Container(
            //     child: AutoSizeText(
            //       "${user["age"]}",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.w600,
            //       ),
            //       overflow: TextOverflow.ellipsis,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildOnlineDot() {
    return Positioned(
      top: 5.0,
      left: 5.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        height: 11,
        width: 11,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
//                        color: widget.isOnline ? Colors.greenAccent : Colors.grey,
              color: Colors.green,
              borderRadius: BorderRadius.circular(6),
            ),
            height: 7,
            width: 7,
          ),
        ),
      ),
    );
  }
}

class UserDetailsPageArguments {
  String id;
  UserDetailsPageArguments({@required this.id});
}
