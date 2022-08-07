
import 'dart:convert';

import 'package:movie_app/data/href.dart';

class Link{
  Href? self;
  Href? previousEpisode;

  Link({
    this.self,
    this.previousEpisode,
  });

  factory Link.fromJson(Map<String, dynamic> json) =>Link(
      self: json["self"]!= null ? Href.fromJson(json["self"]):null,
      previousEpisode:json["previousepisode"]!=null? Href.fromJson(json["previousepisode"]):null
  );
  Map<String, dynamic> toJson() =>{
    "self": self,
    "previousepisode": previousEpisode,
  };
}