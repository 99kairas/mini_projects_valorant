// To parse this JSON data, do
//
//     final detailWeaponResponse = detailWeaponResponseFromJson(jsonString);

import 'dart:convert';

DetailWeaponResponse detailWeaponResponseFromJson(String str) =>
    DetailWeaponResponse.fromJson(json.decode(str));

String detailWeaponResponseToJson(DetailWeaponResponse data) =>
    json.encode(data.toJson());

class DetailWeaponResponse {
  int status;
  Data data;

  DetailWeaponResponse({
    required this.status,
    required this.data,
  });

  factory DetailWeaponResponse.fromJson(Map<String, dynamic> json) =>
      DetailWeaponResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  String uuid;
  String displayName;
  String category;
  String defaultSkinUuid;
  String displayIcon;
  String killStreamIcon;
  String assetPath;
  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skin> skins;

  Data({
    required this.uuid,
    required this.displayName,
    required this.category,
    required this.defaultSkinUuid,
    required this.displayIcon,
    required this.killStreamIcon,
    required this.assetPath,
    required this.weaponStats,
    required this.shopData,
    required this.skins,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uuid: json["uuid"],
        displayName: json["displayName"],
        category: json["category"],
        defaultSkinUuid: json["defaultSkinUuid"],
        displayIcon: json["displayIcon"],
        killStreamIcon: json["killStreamIcon"],
        assetPath: json["assetPath"],
        weaponStats: json['weaponStats'] == null
            ? null
            : WeaponStats.fromJson(json['weaponStats']),
        shopData: json['shopData'] != null
            ? ShopData.fromJson(json['shopData'])
            : null,
        // shopData = json['shopData'] != null
        //     ? ShopData.fromJson(json['shopData'])
        //     : null,
        skins: List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "category": category,
        "defaultSkinUuid": defaultSkinUuid,
        "displayIcon": displayIcon,
        "killStreamIcon": killStreamIcon,
        "assetPath": assetPath,
        "weaponStats": weaponStats?.toJson(),
        "shopData": shopData?.toJson(),
        "skins": List<dynamic>.from(skins.map((x) => x.toJson())),
      };
}

class ShopData {
  int cost;
  String category;
  String categoryText;
  // GridPosition gridPosition;
  bool canBeTrashed;
  dynamic image;
  String newImage;
  dynamic newImage2;
  String assetPath;

  ShopData({
    required this.cost,
    required this.category,
    required this.categoryText,
    // required this.gridPosition,
    required this.canBeTrashed,
    this.image,
    required this.newImage,
    this.newImage2,
    required this.assetPath,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        cost: json["cost"],
        category: json["category"],
        categoryText: json["categoryText"],
        // gridPosition: GridPosition.fromJson(json["gridPosition"]),
        canBeTrashed: json["canBeTrashed"],
        image: json["image"],
        newImage: json["newImage"],
        newImage2: json["newImage2"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "cost": cost,
        "category": category,
        "categoryText": categoryText,
        // "gridPosition": gridPosition.toJson(),
        "canBeTrashed": canBeTrashed,
        "image": image,
        "newImage": newImage,
        "newImage2": newImage2,
        "assetPath": assetPath,
      };
}

class GridPosition {
  int row;
  int column;

  GridPosition({
    required this.row,
    required this.column,
  });

  factory GridPosition.fromJson(Map<String, dynamic> json) => GridPosition(
        row: json["row"],
        column: json["column"],
      );

  Map<String, dynamic> toJson() => {
        "row": row,
        "column": column,
      };
}

class Skin {
  String uuid;
  String displayName;
  String themeUuid;
  String? contentTierUuid;
  String? displayIcon;
  dynamic wallpaper;
  String assetPath;
  List<Chroma> chromas;
  List<Level> levels;

  Skin({
    required this.uuid,
    required this.displayName,
    required this.themeUuid,
    this.contentTierUuid,
    this.displayIcon,
    this.wallpaper,
    required this.assetPath,
    required this.chromas,
    required this.levels,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        uuid: json["uuid"],
        displayName: json["displayName"],
        themeUuid: json["themeUuid"],
        contentTierUuid: json["contentTierUuid"],
        displayIcon: json["displayIcon"],
        wallpaper: json["wallpaper"],
        assetPath: json["assetPath"],
        chromas:
            List<Chroma>.from(json["chromas"].map((x) => Chroma.fromJson(x))),
        levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "themeUuid": themeUuid,
        "contentTierUuid": contentTierUuid,
        "displayIcon": displayIcon,
        "wallpaper": wallpaper,
        "assetPath": assetPath,
        "chromas": List<dynamic>.from(chromas.map((x) => x.toJson())),
        "levels": List<dynamic>.from(levels.map((x) => x.toJson())),
      };
}

class Chroma {
  String uuid;
  String displayName;
  String? displayIcon;
  String fullRender;
  String? swatch;
  String? streamedVideo;
  String assetPath;

  Chroma({
    required this.uuid,
    required this.displayName,
    this.displayIcon,
    required this.fullRender,
    this.swatch,
    this.streamedVideo,
    required this.assetPath,
  });

  factory Chroma.fromJson(Map<String, dynamic> json) => Chroma(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"],
        fullRender: json["fullRender"],
        swatch: json["swatch"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "displayIcon": displayIcon,
        "fullRender": fullRender,
        "swatch": swatch,
        "streamedVideo": streamedVideo,
        "assetPath": assetPath,
      };
}

class Level {
  String uuid;
  String displayName;
  String? levelItem;
  String? displayIcon;
  String? streamedVideo;
  String assetPath;

  Level({
    required this.uuid,
    required this.displayName,
    this.levelItem,
    this.displayIcon,
    this.streamedVideo,
    required this.assetPath,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        uuid: json["uuid"],
        displayName: json["displayName"],
        levelItem: json["levelItem"],
        displayIcon: json["displayIcon"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "levelItem": levelItem,
        "displayIcon": displayIcon,
        "streamedVideo": streamedVideo,
        "assetPath": assetPath,
      };
}

class WeaponStats {
  double fireRate;
  int magazineSize;
  double runSpeedMultiplier;
  double equipTimeSeconds;
  double reloadTimeSeconds;
  double firstBulletAccuracy;
  int shotgunPelletCount;
  String wallPenetration;
  String feature;
  dynamic fireMode;
  String altFireType;
  // AdsStats adsStats;
  dynamic altShotgunStats;
  dynamic airBurstStats;
  List<DamageRange> damageRanges;

  WeaponStats({
    required this.fireRate,
    required this.magazineSize,
    required this.runSpeedMultiplier,
    required this.equipTimeSeconds,
    required this.reloadTimeSeconds,
    required this.firstBulletAccuracy,
    required this.shotgunPelletCount,
    required this.wallPenetration,
    required this.feature,
    this.fireMode,
    required this.altFireType,
    // required this.adsStats,
    this.altShotgunStats,
    this.airBurstStats,
    required this.damageRanges,
  });

  factory WeaponStats.fromJson(Map<String, dynamic> json) => WeaponStats(
        fireRate: json["fireRate"].toDouble(),
        magazineSize: json["magazineSize"],
        runSpeedMultiplier: json["runSpeedMultiplier"]?.toDouble(),
        equipTimeSeconds: json["equipTimeSeconds"]?.toDouble(),
        reloadTimeSeconds: json["reloadTimeSeconds"]?.toDouble(),
        firstBulletAccuracy: json["firstBulletAccuracy"]?.toDouble(),
        shotgunPelletCount: json["shotgunPelletCount"],
        wallPenetration: json["wallPenetration"],
        feature: json["feature"] ?? "",
        fireMode: json["fireMode"],
        altFireType: json["altFireType"] ?? "",
        // adsStats: AdsStats.fromJson(json["adsStats"]),
        altShotgunStats: json["altShotgunStats"],
        airBurstStats: json["airBurstStats"],
        damageRanges: List<DamageRange>.from(
            json["damageRanges"].map((x) => DamageRange.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fireRate": fireRate,
        "magazineSize": magazineSize,
        "runSpeedMultiplier": runSpeedMultiplier,
        "equipTimeSeconds": equipTimeSeconds,
        "reloadTimeSeconds": reloadTimeSeconds,
        "firstBulletAccuracy": firstBulletAccuracy,
        "shotgunPelletCount": shotgunPelletCount,
        "wallPenetration": wallPenetration,
        "feature": feature,
        "fireMode": fireMode,
        "altFireType": altFireType,
        // "adsStats": adsStats.toJson(),
        "altShotgunStats": altShotgunStats,
        "airBurstStats": airBurstStats,
        "damageRanges": List<dynamic>.from(damageRanges.map((x) => x.toJson())),
      };
}

class AdsStats {
  double zoomMultiplier;
  double fireRate;
  double runSpeedMultiplier;
  int burstCount;
  double firstBulletAccuracy;

  AdsStats({
    required this.zoomMultiplier,
    required this.fireRate,
    required this.runSpeedMultiplier,
    required this.burstCount,
    required this.firstBulletAccuracy,
  });

  factory AdsStats.fromJson(Map<String, dynamic> json) => AdsStats(
        zoomMultiplier: json["zoomMultiplier"]?.toDouble(),
        fireRate: json["fireRate"]?.toDouble(),
        runSpeedMultiplier: json["runSpeedMultiplier"]?.toDouble(),
        burstCount: json["burstCount"],
        firstBulletAccuracy: json["firstBulletAccuracy"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "zoomMultiplier": zoomMultiplier,
        "fireRate": fireRate,
        "runSpeedMultiplier": runSpeedMultiplier,
        "burstCount": burstCount,
        "firstBulletAccuracy": firstBulletAccuracy,
      };
}

class DamageRange {
  int rangeStartMeters;
  int rangeEndMeters;
  double headDamage;
  int bodyDamage;
  double legDamage;

  DamageRange({
    required this.rangeStartMeters,
    required this.rangeEndMeters,
    required this.headDamage,
    required this.bodyDamage,
    required this.legDamage,
  });

  factory DamageRange.fromJson(Map<String, dynamic> json) => DamageRange(
        rangeStartMeters: json["rangeStartMeters"],
        rangeEndMeters: json["rangeEndMeters"],
        headDamage: json["headDamage"]?.toDouble(),
        bodyDamage: json["bodyDamage"],
        legDamage: json["legDamage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "rangeStartMeters": rangeStartMeters,
        "rangeEndMeters": rangeEndMeters,
        "headDamage": headDamage,
        "bodyDamage": bodyDamage,
        "legDamage": legDamage,
      };
}
