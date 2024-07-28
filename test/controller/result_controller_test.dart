
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scriptsense/controller/result_controller.dart';
import 'package:scriptsense/model/result_model.dart';
import 'package:scriptsense/ui/pages/result_page.dart';

Future<void> main() async {
  final ResultController controller = ProviderContainer().read(resultControllerProvider.notifier);
  final ResultModel model = ProviderContainer().read(resultControllerProvider);
  WidgetsFlutterBinding.ensureInitialized();

  test("should save to hive", () {
    controller.save();
  });
  
  test("should toggle checkbox", () {
    controller.toggle(0);
    assert(controller.saved[0]);
  });
  
  test("should toggel all", () {
    controller.toggleSelectAll();
    assert(controller.saved[2]);
  });
  ByteData image = await rootBundle.load('assets/Make_Complete.png');
  var baseImage = base64Encode(image.buffer.asUint8List());

  /*
  opencv_dart.dll not found not testable
  test("should recognize character", () async {
    await controller.startAnalysisofImage(baseImage);
    assert(model.identifiedImages[model.lines[0]] != null);
  });

   */
}