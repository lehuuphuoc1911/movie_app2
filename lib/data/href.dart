

class Href {
  String? href;
  Href({this.href});
  factory Href.fromJson(Map<String, dynamic> json) => Href(
      href: json["href"] ?? "",
  );

  Map<String, dynamic> toJson() =>{
    "href": href,
  };
}