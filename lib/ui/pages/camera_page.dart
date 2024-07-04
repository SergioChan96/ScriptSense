import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:scriptsense/controller/camera_page_controller.dart';

class CameraPage extends ConsumerWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraPageModel = ref.watch(cameraPageControllerProvider);
    final camerPageController = ref.read(cameraPageControllerProvider.notifier);
    camerPageController.init();

    return Scaffold(
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
                  camerPageController.loadImage();
                  context.go("/result", extra: cameraPageModel.convertedPic);
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
                null => CameraPreview(camerPageController.controller),
                _ => Image.file(File(cameraPageModel.picture!.path))
              }
          ),
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Row(
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
                    camerPageController.takePicture();
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
          )
        ],
      )
    );
  }
}