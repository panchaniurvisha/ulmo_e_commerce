import 'dart:convert';

class FirstScreenModel {
  List<RoomModel>? pageContent;
  List<RoomFacility>? roomFacility;
  List<PopularItem>? popularItem;
  List<CatalogItem>? catalogItem;
  List<PageContentItem>? pageContentItem;
  List<Address>? address;
  String? height;
  String? width;
  String? depth;
  String? weight;
  String? mainMaterial;
  String? percentage;

  FirstScreenModel({this.height, this.width, this.depth, this.weight, this.mainMaterial, this.percentage, this.pageContent, this.roomFacility, this.popularItem, this.catalogItem, this.pageContentItem, this.address});
  FirstScreenModel.fromJson(Map<String, dynamic> data) {
    height = data["height"];
    width = data["width"];
    depth = data["depth"];
    weight = data["weight"];
    mainMaterial = data["mainMaterial"];
    percentage = data["percentage"];
    pageContent = (data["pageContent"] as List).map((value) => RoomModel.fromJson(value)).toList();
    roomFacility = (data["roomFacility"] as List).map((value) => RoomFacility.fromJson(value)).toList();
    popularItem = (data["popularItem"] as List).map((value) => PopularItem.fromJson(value)).toList();
    catalogItem = (data["catalogItem"] as List).map((value) => CatalogItem.fromJson(value)).toList();
    pageContentItem = (data["pageContentItem"] as List).map((value) => PageContentItem.fromJson(value)).toList();
    address = (data["address"] as List).map((value) => Address.fromJson(value)).toList();
  }
}

class RoomModel {
  String? label;
  String? image;
  RoomModel({this.image, this.label});
  RoomModel.fromJson(Map<String, dynamic> data) {
    image = data["image"];
    label = data["label"];
  }
}

class RoomFacility {
  String? facilityImage;
  RoomFacility({this.facilityImage});
  RoomFacility.fromJson(Map<String, dynamic> data) {
    facilityImage = data["facilityImage"];
  }
}

class PopularItem {
  String? popularImage;
  String? price;
  String? icon;
  String? recentlyNew;
  String? itemName;
  PopularItem({
    this.popularImage,
    this.price,
    this.icon,
    this.itemName,
  });
  PopularItem.fromJson(Map<String, dynamic> data) {
    popularImage = data["popularImage"];
    itemName = data["itemName"];
    price = data["price"];
    icon = data["icon"];
    recentlyNew = data["recentlyNew"];
  }
}

class CatalogItem {
  String? popularImage;
  String? price;
  String? icon;
  String? recentlyNew;
  String? itemName;
  CatalogItem({
    this.popularImage,
    this.price,
    this.icon,
    this.itemName,
  });
  CatalogItem.fromJson(Map<String, dynamic> data) {
    popularImage = data["popularImage"];
    itemName = data["itemName"];
    price = data["price"];
    icon = data["icon"];
    recentlyNew = data["recentlyNew"];
  }
}

class PageContentItem {
  String? popularImage;
  String? price;
  String? icon;
  String? recentlyNew;
  String? itemName;
  PageContentItem({this.popularImage, this.price, this.icon, this.itemName, this.recentlyNew});
  PageContentItem.fromJson(Map<String, dynamic> data) {
    popularImage = data["popularImage"];
    itemName = data["itemName"];
    price = data["price"];
    icon = data["icon"];
    recentlyNew = data["recentlyNew"];
  }
}

class Address {
  String? street;
  String? home;
  Address({this.street, this.home});
  Address.fromJson(Map<String, dynamic> data) {
    street = data["street"];
    home = data["home"];
  }
}

ProfileModel userModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String userModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? name;
  String? number;
  String? image;
  ProfileModel({this.name, this.number, this.image});
  ProfileModel.fromJson(Map<String, dynamic> data) {
    name = data["name"];
    number = data["number"];
    image = data["image"];
  }
}
