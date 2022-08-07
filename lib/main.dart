import 'package:flutter/material.dart';

import 'screen/info.dart';
import 'screen/search.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/": (context) => const SearchPage(),
    //"/info": (context, fulldata) => InfoPage(fullData: fulldata,),
  },
));

