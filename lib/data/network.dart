
import 'dart:convert';

import 'package:movie_app/data/country.dart';

class Network{
  int? id;
  String? name="";
  Country? country;
  String? officialSite="";
  Network({this.id, this.name, this.country,this.officialSite});

  factory Network.fromJson(Map<String, dynamic> json) => Network(
      id: json["id"],
      name: json["name"],
      country:json["country"]!= null? Country.fromJson(json["country"]):null,
      officialSite: json["officialSite"]);

  Map<String,dynamic> toJson() =>{
    "id": id,
    "name": name,
    "country": country,
    "officialSite": officialSite
  };
}