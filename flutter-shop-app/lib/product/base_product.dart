import 'package:flutter_shop_app/category/base_category.dart';
import 'package:flutter_shop_app/category/category_controller.dart';
import 'package:flutter_shop_app/discount/base_discount.dart';
import 'package:flutter_shop_app/discount/discountController.dart';
import 'package:flutter_shop_app/image/base_image.dart';
import 'package:flutter_shop_app/image/image_controller.dart';
import 'package:flutter_shop_app/product_option/base_product_option.dart';
import 'package:flutter_shop_app/product_option/product_option_controller.dart';
import 'package:flutter_shop_app/tag/base_tag.dart';
import 'package:flutter_shop_app/tag/tag_controller.dart';

class BaseProduct {
  String id;
  String title;
  String description;
  double price;
  double quantity;
  List<BaseImage> images;
  List<BaseProductOption> options;
  List<BaseCategory> categories;
  List<BaseTag> tags;
  List<BaseDiscount> discounts;

  BaseProduct(this.id, this.title, this.description, this.price, this.quantity,
      this.images, this.options, this.categories, this.tags, this.discounts);

  BaseProduct.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
    this.images = ImageController.toImages(jsonObject['images']);
    this.options = ProductOptionController.toOptions(jsonObject['options']);
    this.categories = CategoryController.toCategories(jsonObject['catrgories']);
    this.tags = TagController.toTags(jsonObject['tags']);
    this.discounts = DiscountController.toDiscounts(jsonObject['discounts']);
  }
}
