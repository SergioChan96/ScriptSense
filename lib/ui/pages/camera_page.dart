import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

import 'package:scriptsense/controller/camera_page_controller.dart';
import 'package:scriptsense/router/typed_routes.dart';

class CameraPage extends ConsumerWidget {
  const CameraPage({super.key});


  Future<Uint8List> loadImage() async {
    ByteData image = await rootBundle.load('assets/newspaper.jpg');
    return image.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraPageModel = ref.watch(cameraPageControllerProvider);
    final cameraPageController = ref.read(cameraPageControllerProvider.notifier);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  final image = await loadImage();
                  cameraPageController.controller.dispose();
                  ResultRoute(image: base64Encode(image)).go(context);
                },
                icon: Icon(Icons.text_snippet_outlined)
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: switch(cameraPageModel.picture) {
                null => FutureBuilder<void>(
                  future: cameraPageController.init(),
                  builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(cameraPageController.controller);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                _ => Image.file(File(cameraPageModel.picture!.path))
              }
          ),
          Container(
            color: Colors.black,
            height: screenHeight * 0.12,
            child: switch(cameraPageModel.picture) {
              null => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(flex: 1),
                  IconButton(
                      iconSize: screenHeight * 0.06,
                      onPressed: () async {
                        cameraPageController.loadImage();
                        cameraPageController.controller.dispose();
                        ResultRoute(image: base64Encode(cameraPageModel.convertedPic!)).go(context);
                      },
                      icon: Icon(Icons.image)
                  ),
                  Spacer(flex: 1),
                  GestureDetector(
                    onTap: () async {
                      cameraPageController.takePicture();
                    },
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double size = screenHeight * 0.09;
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: size,
                              height: size,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: size * 0.9,
                              height: size * 0.9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                            ),
                            Container(
                              width: size * 0.85,
                              height: size * 0.85,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ]
                        );
                      }
                    ),
                  ),
                  Spacer(flex: 1),
                  IconButton(
                      iconSize: screenHeight * 0.06,
                      onPressed: () {
                        // TO DO:  set the flash for the photo
                      },
                      icon: Icon(Icons.flash_on)
                  ),
                  Spacer(flex: 1)
                ],
              ),
              _ => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                      ),
                    onPressed: () {
                      cameraPageController.saveImage();
                      cameraPageController.controller.dispose();
                      ResultRoute(image: base64Encode(cameraPageModel.convertedPic!)).go(context);
                    },
                    child: Text("Analyze")
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                      ),
                    onPressed: () {
                      cameraPageController.discardPic();
                    },
                    child: Text("Discard")
                  )
                ],
              )
            }
          )
        ],
      )
    );
  }
}
abstract class ICameraPageController {
  void init();
  void takePicture();
  Future<void> loadImage();
  Future<void> saveImage();
  void discardPic();
}