// To parse this JSON data, do
//
//     final gameItemBase = gameItemBaseFromJson(jsonString);

import 'dart:convert';

import './cylinder.dart';
import '../../helpers/jsonHelper.dart';
import '../rating/rating.dart';
import 'box.dart';
import 'feature.dart';
import 'upgrade.dart';

class GameItemBase {
  GameItemBase({
    this.id,
    this.icon,
    this.color,
    this.physicsMaterial,
    this.rating,
    this.box,
    this.cylinder,
    this.flammable,
    this.density,
    this.qualityLevel,
    this.features,
    this.upgrade,
  });

  String id;
  String icon;
  String color;
  String physicsMaterial;
  Rating rating;
  Box box;
  Cylinder cylinder;
  bool flammable;
  double density;
  int qualityLevel;
  Upgrade upgrade;
  List<Feature> features;

  factory GameItemBase.fromRawJson(String str) =>
      GameItemBase.fromJson(json.decode(str));

  factory GameItemBase.fromJson(Map<String, dynamic> json) => GameItemBase(
        id: readStringSafe(json, "Id"),
        icon: readStringSafe(json, "Icon"),
        color: readStringSafe(json, "Color"),
        physicsMaterial: readStringSafe(json, "PhysicsMaterial"),
        rating:
            json["Ratings"] == null ? null : Rating.fromJson(json["Ratings"]),
        box: json["Box"] == null ? null : Box.fromJson(json["Box"]),
        cylinder: json["Cylinder"] == null
            ? null
            : Cylinder.fromJson(json["Cylinder"]),
        upgrade:
            json["Upgrade"] == null ? null : Upgrade.fromJson(json["Upgrade"]),
        features: json["Features"] == null
            ? null
            : List<Feature>.from(
                json["Features"].map((x) => Feature.fromJson(x))),
        flammable: readBoolSafe(json, "Flammable"),
        density: readDoubleSafe(json, "Density"),
        qualityLevel: readIntSafe(json, "QualityLevel"),
      );
}
