
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:scriptsense/controller/camera_page_controller.dart';
import 'package:scriptsense/model/camera_page_model.dart';
import 'package:camera/camera.dart';

import 'camera_page_controller_test.mocks.dart';


@GenerateMocks(<Type>[
  CameraController
])

void main() {
  late MockCameraController mockCameraController;
  late CameraPageController controller;
  late CameraPageModel model;
  late ProviderContainer container;

  setUp(() async {
    mockCameraController = MockCameraController();
    container = ProviderContainer();
    WidgetsFlutterBinding.ensureInitialized();
    controller = container.read(cameraPageControllerProvider.notifier);
    model = container.read(cameraPageControllerProvider);
    Uint8List image = (await rootBundle.load('assets/Make_Complete.png')).buffer.asUint8List();
    when(mockCameraController.takePicture()).thenAnswer((_) async => XFile.fromData(image));
    controller.controller = mockCameraController;
  });

  test("should take new Picture", () {
    controller.takePicture();
    expect(model.picture, isNot(null));
  });

  test("should delete Picture", () {
    controller.discardPic();
    expect(model.picture, null);
  });

}