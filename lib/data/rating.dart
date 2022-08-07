
class Rating{
  double? average;
  Rating({this.average});
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(average: json["average"]);
  Map<String,dynamic> toJson() => {
    "average": average
  };
}