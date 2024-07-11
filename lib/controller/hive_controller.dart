import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scriptsense/model/hive_text_model.dart';

part 'hive_controller.g.dart';

@riverpod
class HiveController extends _$HiveController {

  DateFormat format = DateFormat('d/M/y');

  Box<HiveTextModel>? box;
  @override
  List<HiveTextModel> build() {
    return [];
  }
  Future<void> init() async {
    if(box == null) {
      box = await Hive.openBox<HiveTextModel>('scannedTexts');
      state = box!.values.toList();
    }
  }

  Future<void> updateList() async {
    state = (await Hive.openBox<HiveTextModel>('scannedTexts')).values.toList();
  }

  void sortDescending() {
    state.sort((a, b) =>format.parse(b.scanDate).compareTo(format.parse(a.scanDate)));
    state = state;
  }

  void sortAscending() {
    state.sort((a, b) => format.parse(a.scanDate).compareTo(format.parse(b.scanDate)));
    state = state;
  }
}

