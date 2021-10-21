import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    Key key,
    @required this.userPhotos,
    @required this.photoIndex,
  }) : super(key: key);

  final List<String> userPhotos;
  final int photoIndex;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: MediaQuery.of(context).size.height * 0.60,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      imageUrl: userPhotos[photoIndex],
      progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey,
          child: Container(),
        ),
      ),
      errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
    );
  }
}
