import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:scriptsense/ui/camera_provider.dart';

class CameraPage extends ConsumerWidget {
  const CameraPage({super.key});

  Future<void> loadImage() async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {

    } else {
      print("no image has been picked");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraControllerAsyncValue = ref.watch(cameraProvider);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          IconButton(
              onPressed: () {
                loadImage();
              },
              icon: Icon(Icons.image)
          )
        ],
      ),
      body: cameraControllerAsyncValue.when(
        data: (cameraController) {
          return Column(
            children: [
              Expanded(child: CameraPreview(cameraController)),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.flash_on)
                    ),
                    GestureDetector(
                      onTap: () {
                        // Define the action to take the picture
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
                                  color: Colors.white, // Outer ring color
                                ),
                              ),
                              Container(
                                width: size * 0.9,
                                height: size * 0.9,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent, // Outer ring color
                                ),
                              ),
                              Container(
                                width: size * 0.85,
                                height: size * 0.85,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white, // Inner circle color
                                ),
                              ),
                            ]
                          );
                        }
                      )
                    ),
                  ],
                ),
              )
            ],
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}