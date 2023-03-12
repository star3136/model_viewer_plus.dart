/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var lights = [
    "assets/environments/aircraft_workshop_01_1k.jpg",
    "assets/environments/lebombo_1k.jpg",
    "assets/environments/lightroom_14b.jpg",
    "assets/environments/moon_1k.jpg",
    "assets/environments/moon_4k.jpg",
    "assets/environments/music_hall_01_1k.jpg",
    // "assets/environments/neutral.jpg",
    "assets/environments/pillars_1k.jpg",
    "assets/environments/spot1Lux.jpg",
    "assets/environments/spruit_sunrise_1k_HDR.jpg",
    "assets/environments/spruit_sunrise_1k_LDR.jpg",
    // "assets/environments/whipple_creek_regional_park_04_1k.jpg",
    // "assets/environments/white_furnace.jpg",
  ];

  int lightIndex = 0;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Model Viewer")),
        body: Stack(
          children: [
            ModelViewer(
              key: ValueKey(lightIndex),
              backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
              src: 'assets/Astronaut.glb', // a bundled asset file
              environmentImage: lights[lightIndex],
              alt: "A 3D model of an astronaut",
              ar: true,
              arModes: ['scene-viewer', 'webxr', 'quick-look'],
              autoRotate: true,
              cameraControls: true,
              iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
              disableZoom: true,
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    lightIndex = (lightIndex + 1) % lights.length;
                  });
                },
                child: Text("切换光照"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
