class FirstScreenModel {
  List<RoomModel>? pageContent;
  List<RoomFacility>? roomFacility;
  List<PopularItem>? popularItem;
  List<CatalogItem>? catalogItem;
  List<PageContentItem>? pageContentItem;
  List<Measurement>? measurement;

  FirstScreenModel({this.pageContent, this.roomFacility, this.popularItem, this.catalogItem, this.pageContentItem});
  FirstScreenModel.fromJson(Map<String, dynamic> data) {
    pageContent = (data["pageContent"] as List).map((value) => RoomModel.fromJson(value)).toList();
    roomFacility = (data["roomFacility"] as List).map((value) => RoomFacility.fromJson(value)).toList();
    popularItem = (data["popularItem"] as List).map((value) => PopularItem.fromJson(value)).toList();
    catalogItem = (data["catalogItem"] as List).map((value) => CatalogItem.fromJson(value)).toList();
    pageContentItem = (data["pageContentItem"] as List).map((value) => PageContentItem.fromJson(value)).toList();
    measurement = (data["measurement"] as List).map((value) => Measurement.fromJson(value)).toList();
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

class Measurement {
  String? height;
  String? width;
  String? depth;
  String? weight;

  Measurement({this.height, this.width, this.depth, this.weight});
  Measurement.fromJson(Map<String, dynamic> data) {
    height = data["height"];
    width = data["width"];
    depth = data["depth"];
    weight = data["weight"];
  }
}
