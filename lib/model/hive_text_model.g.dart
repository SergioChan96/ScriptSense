// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_text_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTextModelAdapter extends TypeAdapter<HiveTextModel> {
  @override
  final int typeId = 0;

  @override
  HiveTextModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTextModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      isFavorite: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTextModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.originalText)
      ..writeByte(1)
      ..write(obj.translatedText)
      ..writeByte(2)
      ..write(obj.scanDate)
      ..writeByte(3)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTextModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
