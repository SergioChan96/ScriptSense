import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:scriptsense/controller/hive_controller.dart';
import 'package:scriptsense/model/hive_text_model.dart';

void main() {
  late HiveController controller;
  late List<ModelWrapper> model;
  late ProviderContainer container;
  Hive.registerAdapter(HiveTextModelAdapter());

  setUp(() async {
    await setUpTestHive();
    final box = await Hive.openBox<HiveTextModel>('scannedTexts');
    await box.add(HiveTextModel("lol", "xD", "31/12/2023"));
    await box.add(HiveTextModel("test", "test", "31/12/2022"));
    WidgetsFlutterBinding.ensureInitialized();
    container = ProviderContainer();
    controller = container.read(hiveControllerProvider.notifier);
    await controller.init();
    model = container.read(hiveControllerProvider);
  });

  tearDown(() async {
    await Hive.box<HiveTextModel>('scannedTexts').close();
    await tearDownTestHive();
  });


  test("should initialize list", () {
    expect(model.isNotEmpty, isTrue);
  });

  test("should favorite a card", () {
    var item = model[0];
    HiveTextModel updatedItem = HiveTextModel(
      item.model.originalText,
      item.model.translatedText,
      item.model.scanDate,
      isFavorite: true,
    );
    controller.addFavorite(0, ModelWrapper(0, updatedItem));
    expect(model[0].model.isFavorite, updatedItem.isFavorite);
    item = model[0];
    HiveTextModel updatedItem1 = HiveTextModel(
      item.model.originalText,
      item.model.translatedText,
      item.model.scanDate,
      isFavorite: !item.model.isFavorite,
    );
    controller.addFavorite(0, ModelWrapper(item.index, updatedItem1));
    expect(model[0].model.isFavorite, updatedItem1.isFavorite);
  });


  test("should sort",() {
    var firstItem = model[0];
    controller.sortAscending();
    expect(firstItem.index, isNot(model[0].index));
  });

  test("should sort descending", () {
    var firstItem = model[0];
    controller.sortDescending();
    expect(firstItem.index, isNot(model[1].index));
  });

  test("should delete", () {
    var firstItem = model[0];
    controller.delete(0, firstItem.index);
  });

}