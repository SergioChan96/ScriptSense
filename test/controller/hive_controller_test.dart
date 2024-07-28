import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scriptsense/controller/hive_controller.dart';
import 'package:scriptsense/model/hive_text_model.dart';

void main() {
  final HiveController controller = ProviderContainer().read(hiveControllerProvider.notifier);
  final List<ModelWrapper> model = ProviderContainer().read(hiveControllerProvider);
  WidgetsFlutterBinding.ensureInitialized();

  test("should initialize list", () async {
    await controller.init();
    assert(model.isNotEmpty);
  });

  test("should favorite a card", () {
    var item = model[2];
    HiveTextModel updatedItem = HiveTextModel(
      item.model.originalText,
      item.model.translatedText,
      item.model.scanDate,
      isFavorite: !item.model.isFavorite,
    );
    controller.addFavorite(2, ModelWrapper(item.index, updatedItem));
    assert(model[2].model.isFavorite == updatedItem.isFavorite);
    item = model[2];
    HiveTextModel updatedItem1 = HiveTextModel(
      item.model.originalText,
      item.model.translatedText,
      item.model.scanDate,
      isFavorite: !item.model.isFavorite,
    );
    controller.addFavorite(2, ModelWrapper(item.index, updatedItem1));
    assert(model[2].model.isFavorite == updatedItem1.isFavorite);
  });


  test("should sort",() {
    var firstItem = model[0];
    controller.sortAscending();
    assert(firstItem.index != model[0].index);
  });

  test("should sort descending", () {
    var firstItem = model[0];
    controller.sortDescending();
    assert(firstItem.index != model[0].index);
  });

}