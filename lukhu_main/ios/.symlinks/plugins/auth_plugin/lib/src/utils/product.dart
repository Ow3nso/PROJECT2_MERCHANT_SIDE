import 'app_util.dart';

class Product {
  String id;
  String name;
  String image;
  bool isOnOffer;
  String description;
  String price;
  String originalPrice;
  String size;
  bool isFavorite;
  bool isHourlyOffer;
  String hourlyDescription;
  bool isVerified;
  bool isSoldOut;
  int quantity;
  int likes;
  bool isProductOnSale;
  String store;
  String location;
  String itemCode;
  String condition;

  Product(
      {this.id = '',
      this.name = '',
      required this.image,
      this.isOnOffer = false,
      this.description = '',
      this.price = '0',
      this.originalPrice = '0',
      this.size = 'UK 8',
      this.isFavorite = false,
      this.isHourlyOffer = false,
      this.hourlyDescription = '',
      this.isVerified = false,
      this.isSoldOut = false,
      this.quantity = 1,
      this.likes = 0,
      this.isProductOnSale = false,
      this.store = 'converse_png',
      this.location = 'Lavington',
      this.itemCode = '777',
      this.condition = 'Brand New'}) {
    id = AppUtil.generateRandomString(10);
  }
}
