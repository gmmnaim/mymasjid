import 'package:hive/hive.dart';

part 'hadith_model.g.dart';

@HiveType(typeId: 0)
class HadithModel {

  @HiveField(0)
  final String englishNarrator;

  @HiveField(1)
  final String hadithEnglish;

  @HiveField(2)
  final String bookSlug;

  HadithModel({
    required this.englishNarrator,
    required this.hadithEnglish,
    required this.bookSlug,
  });

  factory HadithModel.fromJson(Map<String,dynamic> json){
    return HadithModel(
      englishNarrator: json['englishNarrator'] ?? '',
      hadithEnglish: json['hadithEnglish'] ?? '',
      bookSlug: json['bookSlug'] ?? '',
    );
  }
}
