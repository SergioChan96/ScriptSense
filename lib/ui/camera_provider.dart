import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraProvider = FutureProvider<CameraController>((ref) async {
  final cameras = await availableCameras();
  final cameraController = CameraController(
    cameras[0],
    ResolutionPreset.high,
    enableAudio: false,
  );
  await cameraController.initialize();
  ref.onDispose(() {
    cameraController.dispose();
  });
  return cameraController;
});

