import 'package:flutter/widgets.dart';

late Size appSize;
late double width;

void initializeAppSize(BuildContext context) {
  appSize = MediaQuery.of(context).size;
  width = appSize.width;
}