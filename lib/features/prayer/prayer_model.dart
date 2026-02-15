import 'package:hive/hive.dart';

part 'prayer_model.g.dart';

@HiveType(typeId: 1)
class PrayerModel {

  @HiveField(0)
  final String date;

  @HiveField(1)
  final String weekday;

  @HiveField(2)
  final String hijriDate;

  @HiveField(3)
  final String sunrise;

  @HiveField(4)
  final String sunset;

  @HiveField(5)
  final String jumuah;

  @HiveField(6)
  final String fajr;

  @HiveField(7)
  final String dhuhr;

  @HiveField(8)
  final String asr;

  @HiveField(9)
  final String maghrib;

  @HiveField(10)
  final String isha;

  @HiveField(11)
  final String saheri;

  @HiveField(12)
  final String iftar;

  PrayerModel({
    required this.date,
    required this.weekday,
    required this.hijriDate,
    required this.sunrise,
    required this.sunset,
    required this.jumuah,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.saheri,
    required this.iftar,
  });

  factory PrayerModel.fromJson(Map<String,dynamic> json){

    final en = json['data']['en'];

    return PrayerModel(
      date: en['date'],
      weekday: en['weekday'],
      hijriDate: en['hijri_date'],
      sunrise: en['sunrise']['time'],
      sunset: en['sunset']['time'],
      jumuah: en['jumuah']['time'],
      fajr: en['fajr']['time'],
      dhuhr: en['dhuhr']['time'],
      asr: en['asr']['time'],
      maghrib: en['maghrib']['time'],
      isha: en['isha']['time'],
      saheri: en['saheri']['time'],
      iftar: en['iftar']['time'],
    );
  }
}
