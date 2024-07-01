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
      // open route and give picture with it
    } else {
      print("no image has been  picked");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraControllerAsyncValue = ref.watch(cameraProvider);

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
                  loadImage();
                },
                icon: Icon(Icons.image)
            )
          ],
        ),
      ),
      body: cameraControllerAsyncValue.when(
        data: (cameraController) {
          return Column(
            children: [
              Expanded(child: CameraPreview(cameraController)),
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
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}