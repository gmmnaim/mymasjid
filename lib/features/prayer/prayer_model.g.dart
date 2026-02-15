// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerModelAdapter extends TypeAdapter<PrayerModel> {
  @override
  final int typeId = 1;

  @override
  PrayerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerModel(
      date: fields[0] as String,
      weekday: fields[1] as String,
      hijriDate: fields[2] as String,
      sunrise: fields[3] as String,
      sunset: fields[4] as String,
      jumuah: fields[5] as String,
      fajr: fields[6] as String,
      dhuhr: fields[7] as String,
      asr: fields[8] as String,
      maghrib: fields[9] as String,
      isha: fields[10] as String,
      saheri: fields[11] as String,
      iftar: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.weekday)
      ..writeByte(2)
      ..write(obj.hijriDate)
      ..writeByte(3)
      ..write(obj.sunrise)
      ..writeByte(4)
      ..write(obj.sunset)
      ..writeByte(5)
      ..write(obj.jumuah)
      ..writeByte(6)
      ..write(obj.fajr)
      ..writeByte(7)
      ..write(obj.dhuhr)
      ..writeByte(8)
      ..write(obj.asr)
      ..writeByte(9)
      ..write(obj.maghrib)
      ..writeByte(10)
      ..write(obj.isha)
      ..writeByte(11)
      ..write(obj.saheri)
      ..writeByte(12)
      ..write(obj.iftar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
