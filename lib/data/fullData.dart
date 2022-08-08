import 'externals.dart';
import 'image.dart';
import 'link.dart';
import 'network.dart';
import 'rating.dart';
import 'schedule.dart';

class FullData {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  String? premiered;
  String? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  String? webChannel;
  String? dvdCountry;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  Link? link;

  FullData({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.link,
  });

  factory FullData.fromJson(Map<String, dynamic> json) => FullData(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: json["genres"] != null ? (json["genres"]).cast<String>() : null,
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: json["premiered"],
        ended: json["ended"],
        officialSite: json["officialSite"],
        schedule: json["schedule"] != null
            ? Schedule.fromJson(json["schedule"])
            : null,
        rating: json["rating"] != null ? Rating.fromJson(json["rating"]) : null,
        weight: json["weight"],
        network:
            json["network"] != null ? Network.fromJson(json["network"]) : null,
        webChannel: json["weChannel"],
        dvdCountry: json["dvdCountry"],
        externals: json["externals"] != null
            ? Externals.fromJson(json["externals"])
            : null,
        image: json["image"] != null ? Image.fromJson(json["image"]) : null,
        summary: json["summary"],
        updated: json["updated"],
        link: json["_links"] != null ? Link.fromJson(json["_links"]) : null,
      );
}
