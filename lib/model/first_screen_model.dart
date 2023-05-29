class FirstScreenModel {
  List<RoomModel>? pageContent;
  List<RoomFacility>? roomFacility;
  List<PopularItem>? popularItem;

  FirstScreenModel({
    this.pageContent,
    this.roomFacility,
    this.popularItem,
  });
  FirstScreenModel.fromJson(Map<String, dynamic> data) {
    pageContent = (data["pageContent"] as List)
        .map((value) => RoomModel.fromJson(value))
        .toList();
    roomFacility = (data["roomFacility"] as List)
        .map((value) => RoomFacility.fromJson(value))
        .toList();
    popularItem = (data["popularItem"] as List)
        .map((value) => PopularItem.fromJson(value))
        .toList();
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
