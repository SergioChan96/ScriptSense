import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

import '../model/hive_text_model.dart';

class HiveBoxState extends StateNotifier<List<HiveTextModel>> {
  HiveBoxState() : super([]);

  Future<void> loadItems() async {
    final box = await Hive.openBox<HiveTextModel>('scannedTexts');
    state = box.values.toList();
  }

  Future<void> addItem(HiveTextModel item) async {
    final box = await Hive.openBox<HiveTextModel>('scannedTexts');
    await box.add(item);
    state = box.values.toList();
  }
}

//final hiveBoxProvider = StateNotifierProvider<HiveBoxState, List<HiveTextModel>>((ref) => HiveBoxState());

final hiveBoxProvider = FutureProvider<Box<HiveTextModel>>((ref) async {
  final box = await Hive.openBox<HiveTextModel>('scannedTexts');
  return box;
});
