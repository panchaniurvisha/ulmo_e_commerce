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
  List<Order>? order;

  FirstScreenModel(
      {this.height,
      this.width,
      this.depth,
      this.weight,
      this.mainMaterial,
      this.percentage,
      this.pageContent,
      this.roomFacility,
      this.popularItem,
      this.catalogItem,
      this.pageContentItem,
      this.order,
      this.address});
  FirstScreenModel.fromJson(Map<String, dynamic> data) {
    height = data["height"];
    width = data["width"];
    depth = data["depth"];
    weight = data["weight"];
    mainMaterial = data["mainMaterial"];
    percentage = data["percentage"];
    pageContent = (data["pageContent"] as List)
        .map((value) => RoomModel.fromJson(value))
        .toList();
    roomFacility = (data["roomFacility"] as List)
        .map((value) => RoomFacility.fromJson(value))
        .toList();
    popularItem = (data["popularItem"] as List)
        .map((value) => PopularItem.fromJson(value))
        .toList();
    catalogItem = (data["catalogItem"] as List)
        .map((value) => CatalogItem.fromJson(value))
        .toList();
    pageContentItem = (data["pageContentItem"] as List)
        .map((value) => PageContentItem.fromJson(value))
        .toList();
    address = (data["address"] as List)
        .map((value) => Address.fromJson(value))
        .toList();
    order =
        (data["order"] as List).map((value) => Order.fromJson(value)).toList();
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
  PageContentItem(
      {this.popularImage,
      this.price,
      this.icon,
      this.itemName,
      this.recentlyNew});
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

class Order {
  String? time;
  String? price;
  String? aboutTime;
  String? number;
  Order({this.number, this.price, this.aboutTime, this.time});
  Order.fromJson(Map<String, dynamic> data) {
    time = data["time"];
    price = data["price"];
    aboutTime = data["aboutTime"];
    number = data["number"];
  }
}

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  String? number;
  String? dateOfBirth;
  String? fullName;
  String? id;
  String? email;
  String? image;
  String? country;
  String? city;
  String? street;
  String? houseNumber;
  String? postCode;

  AccountModel({
    this.number,
    this.dateOfBirth,
    this.fullName,
    this.id,
    this.email,
    this.image,
    this.country,
    this.city,
    this.street,
    this.houseNumber,
    this.postCode,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        number: json["number"],
        dateOfBirth: json["date_of_birth"],
        fullName: json["fullName"],
        id: json["id"],
        email: json["email"],
        image: json["image"],
        country: json["country"],
        city: json["city"],
        street: json["street"],
        houseNumber: json["houseNumber"],
        postCode: json["postCode"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "date_of_birth": dateOfBirth,
        "fullName": fullName,
        "id": id,
        "email": email,
        "image": image,
        "country": country,
        "city": city,
        "street": street,
        "houseNumber": houseNumber,
        "postCode": postCode,
      };
}
