import 'package:flutter_shop_app/tag/base_tag.dart';

class TagController {
  BaseTag tag;

  TagController(this.tag);

  static List<BaseTag> toTags(List<Map<String, dynamic>> jsonObject) {}
}
