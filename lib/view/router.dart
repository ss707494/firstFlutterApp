import 'package:flutter/widgets.dart';
import 'package:flutter_app/view/home.dart';

final Map<String, WidgetBuilder> routers = {
  '/': (BuildContext context) => Home(),
};
