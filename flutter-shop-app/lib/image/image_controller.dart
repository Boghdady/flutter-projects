import 'package:flutter_shop_app/image/base_image.dart';

class ImageController {
  BaseImage image;

  ImageController(this.image);

  static List<BaseImage> toImages(List<Map<String, dynamic>> jsonObject) {}
}
