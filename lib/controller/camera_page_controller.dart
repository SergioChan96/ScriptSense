import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:scriptsense/model/camera_page_model.dart';

part "camera_page_controller.g.dart";

@riverpod
class CameraPageController extends _$CameraPageController {
  late CameraController controller;
  bool initStarted = false;
  @override
  CameraPageModel build() {
    return CameraPageModel.initial();
  }
  Future<void> init() async {
    if(initStarted) {
      return;
    }
    initStarted = true;
    final cameras = await availableCameras();
    final cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController.initialize();
    controller = cameraController;
  }

  void takePicture() async {
    XFile pic = await controller.takePicture();
    Uint8List bytes = await pic.readAsBytes();
    state = state.copyWith(picture: pic, convertedPic: bytes);
  }

  Future<void> loadImage() async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List bytes = await pickedFile.readAsBytes();
      state = state.copyWith(picture: pickedFile, convertedPic: bytes);
    } else {
      print("no image has been picked");
    }
  }

  void discardPic() {
    state = state.copyWith(picture: null, convertedPic: null);
  }
}

