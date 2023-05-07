// To parse this JSON data, do
//
//     final listMapsResponse = listMapsResponseFromJson(jsonString);

import 'dart:convert';

ListMapsResponse listMapsResponseFromJson(String str) =>
    ListMapsResponse.fromJson(json.decode(str));

String listMapsResponseToJson(ListMapsResponse data) =>
    json.encode(data.toJson());

class ListMapsResponse {
  int status;
  List<Datum> data;

  ListMapsResponse({
    required this.status,
    required this.data,
  });

  factory ListMapsResponse.fromJson(Map<String, dynamic> json) =>
      ListMapsResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String uuid;
  String displayName;
  String coordinates;
  String? displayIcon;
  String listViewIcon;
  String splash;
  String assetPath;
  String mapUrl;
  double xMultiplier;
  double yMultiplier;
  double xScalarToAdd;
  double yScalarToAdd;
  List<Callout>? callouts;

  Datum({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    this.displayIcon,
    required this.listViewIcon,
    required this.splash,
    required this.assetPath,
    required this.mapUrl,
    required this.xMultiplier,
    required this.yMultiplier,
    required this.xScalarToAdd,
    required this.yScalarToAdd,
    this.callouts,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        splash: json["splash"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"]?.toDouble(),
        yMultiplier: json["yMultiplier"]?.toDouble(),
        xScalarToAdd: json["xScalarToAdd"]?.toDouble(),
        yScalarToAdd: json["yScalarToAdd"]?.toDouble(),
        callouts: json["callouts"] == null
            ? []
            : List<Callout>.from(
                json["callouts"]!.map((x) => Callout.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "coordinates": coordinates,
        "displayIcon": displayIcon,
        "listViewIcon": listViewIcon,
        "splash": splash,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": callouts == null
            ? []
            : List<dynamic>.from(callouts!.map((x) => x.toJson())),
      };
}

class Callout {
  String regionName;
  SuperRegionName superRegionName;
  Location location;

  Callout({
    required this.regionName,
    required this.superRegionName,
    required this.location,
  });

  factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: superRegionNameValues.map[json["superRegionName"]]!,
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "superRegionName": superRegionNameValues.reverse[superRegionName],
        "location": location.toJson(),
      };
}

class Location {
  double x;
  double y;

  Location({
    required this.x,
    required this.y,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

enum SuperRegionName { A, ATTACKER_SIDE, B, MID, DEFENDER_SIDE, C }

final superRegionNameValues = EnumValues({
  "A": SuperRegionName.A,
  "Attacker Side": SuperRegionName.ATTACKER_SIDE,
  "B": SuperRegionName.B,
  "C": SuperRegionName.C,
  "Defender Side": SuperRegionName.DEFENDER_SIDE,
  "Mid": SuperRegionName.MID
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
