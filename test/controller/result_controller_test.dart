import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

import 'package:scriptsense/controller/result_controller.dart';
import 'package:scriptsense/model/hive_text_model.dart';
//import 'package:scriptsense/model/result_model.dart';


Future<void> main() async {
  late ResultController controller;
 // late ResultModel model;
  late ProviderContainer container;
  Hive.registerAdapter(HiveTextModelAdapter());

  setUp(() async {
    await setUpTestHive();
    await Hive.openBox<HiveTextModel>('scannedTexts');
    WidgetsFlutterBinding.ensureInitialized();
    container = ProviderContainer();
    controller = container.read(resultControllerProvider.notifier);
   // model = container.read(resultControllerProvider);
    controller.saved = [false, false, false, false];
  });

  tearDown(() async {
    await Hive.box<HiveTextModel>('scannedTexts').close();
    await tearDownTestHive();
  });

  test("should save nothing to hive", () {
    controller.save();
  });
  
  test("should toggel all", () {
    controller.toggleSelectAll();
    expect(controller.saved[2], isTrue);
  });


  /*
  cant be tested because of dependence on opencv_dart
  test("should save item to hive", () {
    controller.saved = [true, false, false, false];
    controller.state = state.copyWith()
  });

  same reason as the above
  test("should toggle checkbox", () {
    controller.toggle(0);
    expect(controller.saved[0], isTrue);
  });


  No opencv_dart.dll found cant be tested without this
  WidgetsFlutterBinding.ensureInitialized();
  ByteData image = await rootBundle.load('assets/Make_Complete.png');
  var baseImage = base64Encode(image.buffer.asUint8List());

  test("should recognize character", () async {
    await controller.startAnalysisofImage(baseImage);
    expect(model.identifiedImages[model.lines[0]], isNot(null));
  });
   */
}