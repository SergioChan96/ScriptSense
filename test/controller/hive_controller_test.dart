import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:scriptsense/controller/hive_controller.dart';
import 'package:scriptsense/model/hive_text_model.dart';

import 'hive_controller_test.mocks.dart';

@GenerateMocks(<Type>[
  Box<HiveTextModel>
])

void main() {
  late MockBox<HiveTextModel> mockHiveBox;
  setUp(() {
    mockHiveBox = MockBox<HiveTextModel>();
  });

  WidgetsFlutterBinding.ensureInitialized();

  (HiveController, List<ModelWrapper>) createHiveController() {
    final HiveController controller = ProviderContainer().read(hiveControllerProvider.notifier);
    final List<ModelWrapper> model = ProviderContainer().read(hiveControllerProvider);
    controller.box = mockHiveBox;
    final KeepAliveLink keepAliveLink = controller.ref.keepAlive();
    addTearDown(keepAliveLink.close);
    return (controller, model);
  }

  test("should initialize list", () async {
    final hivePackage = createHiveController();
    expect(hivePackage.$2.isEmpty, isTrue);
  });

  test("should favorite a card", () {
    final hivePackage = createHiveController();
    HiveTextModel item = HiveTextModel(
      "test",
      "test",
      "31/12/2023",
      isFavorite: false,
    );
    hivePackage.$1.box?.add(item);

    controller.addFavorite(0, ModelWrapper(0, item));
    expect(model[2].model.isFavorite, updatedItem.isFavorite);
    item = model[2];
    HiveTextModel updatedItem1 = HiveTextModel(
      item.model.originalText,
      item.model.translatedText,
      item.model.scanDate,
      isFavorite: !item.model.isFavorite,
    );
    controller.addFavorite(2, ModelWrapper(item.index, updatedItem1));
    expect(model[2].model.isFavorite, updatedItem1.isFavorite);
  });


  test("should sort",() {
    var firstItem = model[0];
    controller.sortAscending();
    expect(firstItem.index, isNot(model[0].index));
  });

  test("should sort descending", () {
    var firstItem = model[0];
    controller.sortDescending();
    expect(firstItem.index, isNot(model[0].index));
  });

}