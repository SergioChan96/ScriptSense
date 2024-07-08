import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:opencv_dart/opencv_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:scriptsense/model/hive_text_model.dart';

//part 'hive_controller.g.dart';

/*class HiveController extends StateNotifier<List<HiveTextModel>> {
  HiveController() : super([]);

  Future<void> loadItems() async {
    final box = await Hive.openBox<HiveTextModel>('scannedTexts');
    state = box.values.toList();
  }

  Future<void> addItem(HiveTextModel item) async {
    final box = await Hive.openBox<HiveTextModel>('scannedTexts');
    await box.add(item);
    state = box.values.toList();
  }
}*/


final hiveTextModelProvider = StateNotifierProvider<HiveTextModelNotifier, List<HiveTextModel>>((ref) {
  return HiveTextModelNotifier();
});

class HiveTextModelNotifier extends StateNotifier<List<HiveTextModel>> {
  HiveTextModelNotifier() : super([]) {
    loadHiveData();
  }

  Box<HiveTextModel>? box;

  Future<void> loadHiveData() async {
    box = await Hive.openBox<HiveTextModel>('scannedTexts');
    state = box?.values.toList() ?? [];
  }

  void addHiveTextModel(HiveTextModel model) {
    box?.add(model);
    state = box?.values.toList() ?? [];
  }

  void updateHiveTextModel(int index, HiveTextModel model) {
    box?.putAt(index, model);
    state = box?.values.toList() ?? [];
  }

  void deleteHiveTextModel(int index) {
    box?.deleteAt(index);
    state = box?.values.toList() ?? [];
  }
}

