class Externals {
  int? tvrate;
  int? thetvdb;
  String? imdb;

  Externals({this.tvrate, this.thetvdb, this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrate: json["tvrate"],
        thetvdb: json["thetvdb"],
        imdb: json["imdb"],
      );

  Map<String, dynamic> toJson() =>
      {"tvrate": tvrate, "thetvdb": thetvdb, "imdb": imdb};
}
