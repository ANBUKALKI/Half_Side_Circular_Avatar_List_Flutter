
import 'dart:js';

import 'package:circlemate/screen/avatar_circle_menu.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';


void main() {
  runApp(DevicePreview(
    enabled: true,
      builder: (context) => const MyApp()
  )
);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Menu',
      home: AvatarCircleMenu(),
    );
  }
}




