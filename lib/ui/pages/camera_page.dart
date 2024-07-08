import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:scriptsense/controller/camera_page_controller.dart';
import 'package:scriptsense/router/typed_routes.dart';

class CameraPage extends ConsumerWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraPageModel = ref.watch(cameraPageControllerProvider);
    final cameraPageController = ref.read(cameraPageControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
        child: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  cameraPageController.loadImage();
                  ResultRoute(image: base64Encode(cameraPageModel.convertedPic!)).go(context);
                },
                icon: Icon(Icons.image)
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
            height: MediaQuery.of(context).size.height * 0.12,
            child: switch(cameraPageModel.picture) {
              null => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(flex: 1),
                  IconButton(
                      iconSize: MediaQuery.of(context).size.height * 0.08,
                      onPressed: () {
                        // set the flash for the photo
                      },
                      icon: Icon(Icons.flash_on)
                  ),
                  Spacer(flex: 1),
                  GestureDetector(
                    onTap: () async {
                      cameraPageController.takePicture();
                      // preview of of picture and route to new page with picture
                    },
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double size = MediaQuery.of(context).size.height * 0.1;
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
                    )
                  ),
                  Spacer(flex: 5)
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