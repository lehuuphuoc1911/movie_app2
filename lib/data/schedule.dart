class Schedule {
  String? time = "";
  List<String>? days;

  Schedule({this.time, this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: json["days"] != null ? (json["days"]).cast<String>() : null,
      );

  Map<String, dynamic> toJson() => {"time": time, "days": days};
}
