import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scriptsense/model/hive_text_model.dart';

part 'hive_controller.g.dart';

@riverpod
class HiveController extends _$HiveController {

  DateFormat format = DateFormat('d/M/y');

  Map<int, int> indexMap = Map();

  Box<HiveTextModel>? box;
  @override
  List<ModelWrapper> build() {
    return [];
  }
  Future<void> init() async {
    if(box == null) {
      box = await Hive.openBox<HiveTextModel>('scannedTexts');
      List<HiveTextModel> tmp = box!.values.toList();
      List<ModelWrapper> modelList = [];
      for (int i = 0; i < tmp.length; i++) {
        modelList.add(ModelWrapper(i, tmp[i]));
      }
      state = modelList;
    }
  }

  void addFavorite(int index, ModelWrapper model) {
    box?.putAt(model.index, model.model);
    state[index] = model;
  }

  void delete(int index, int boxIndex) {
    box?.deleteAt(boxIndex);
    state.removeAt(index);
    state = state;
  }

  void sortDescending() {
    state.sort((a, b) => format.parse(b.model.scanDate).compareTo(format.parse(a.model.scanDate)));
    state = state;
  }

  void sortAscending() {
    state.sort((a, b) => format.parse(a.model.scanDate).compareTo(format.parse(b.model.scanDate)));
    state = state;
  }
}
class ModelWrapper {
  int index;
  HiveTextModel model;
  ModelWrapper(this.index, this.model);
}

