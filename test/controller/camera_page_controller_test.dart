
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scriptsense/controller/camera_page_controller.dart';
import 'package:scriptsense/model/camera_page_model.dart';
import 'package:scriptsense/ui/pages/camera_page.dart';

void main() {
  final ICameraPageController camera_controller = ProviderContainer().read(cameraPageControllerProvider.notifier);
  final CameraPageModel model = ProviderContainer().read(cameraPageControllerProvider);
  camera_controller.init();

  test("should take new Picture", () {
    camera_controller.takePicture();
    assert(model.picture != null);
  });

  test("should delete Picture", () {
    camera_controller.discardPic();
    assert(model.picture == null);
  });

}