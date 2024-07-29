
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:scriptsense/controller/camera_page_controller.dart';
import 'package:scriptsense/model/camera_page_model.dart';
import 'package:camera/camera.dart';

import 'camera_page_controller_test.mocks.dart';

@GenerateMocks(<Type>[
  CameraController
])

void main() {
  late MockCameraController mockCameraController;
  setUp(() async {
    mockCameraController = MockCameraController();
  });
  final CameraPageController camera_controller = ProviderContainer().read(cameraPageControllerProvider.notifier);
  camera_controller.controller = mockCameraController;

  final CameraPageModel model = ProviderContainer().read(cameraPageControllerProvider);
  WidgetsFlutterBinding.ensureInitialized();

  test("should take new Picture", () {
    camera_controller.takePicture();
    expect(model.picture, isNot(null));
  });

  test("should delete Picture", () {
    camera_controller.discardPic();
    expect(model.picture, null);
  });

}