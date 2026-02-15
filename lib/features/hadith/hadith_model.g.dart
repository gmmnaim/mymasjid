// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HadithModelAdapter extends TypeAdapter<HadithModel> {
  @override
  final int typeId = 0;

  @override
  HadithModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HadithModel(
      englishNarrator: fields[0] as String,
      hadithEnglish: fields[1] as String,
      bookSlug: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HadithModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishNarrator)
      ..writeByte(1)
      ..write(obj.hadithEnglish)
      ..writeByte(2)
      ..write(obj.bookSlug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HadithModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
