class FirstScreenModel {
  List<RoomModel>? pageContent;
  List<RoomFacility>? roomFacility;

  FirstScreenModel({
    this.pageContent,
    this.roomFacility,
  });
  FirstScreenModel.fromJson(Map<String, dynamic> data) {
    pageContent = (data["pageContent"] as List)
        .map((value) => RoomModel.fromJson(value))
        .toList();
    roomFacility = (data["roomFacility"] as List)
        .map((value) => RoomFacility.fromJson(value))
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
