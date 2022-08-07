import 'package:flutter/material.dart';

class MyUtil {
  static ImageProvider imageProvider(String imageUrl) {
    //return imageUrl != "" ? NetworkImage(imageUrl): AssetImage("assets/img_1.png");
    if (imageUrl != "") {
      return NetworkImage(imageUrl);
    } else {
      return const AssetImage("assets/img_1.png");
    }
  }
  static const String dataNullError = "No movie found";
  static const String noResponseError = "Request failed";
}
