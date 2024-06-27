import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_provider.dart';

class CameraPage extends ConsumerWidget {
  const CameraPage({super.key});

  Future<void> loadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
          return CameraPreview(cameraController);
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}