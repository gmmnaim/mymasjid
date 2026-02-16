import 'package:intl/intl.dart';
import 'features/prayer/prayer_model.dart';

class NextPrayerCalculator {
  static String getNextPrayerCountdown(PrayerModel? prayer) {
    if (prayer == null) return "--";

    DateTime now = DateTime.now();

    String today = DateFormat('EEEE').format(now);

    List<String> prayerTimes = [
      prayer.fajr,

      today == "Friday" ? prayer.jumuah : prayer.dhuhr,

      prayer.asr,
      prayer.maghrib,
      prayer.isha,
    ];

    List<DateTime> parsedTimes = prayerTimes.map((time) {
      DateTime parsed = DateFormat("hh:mm a").parse(time);

      return DateTime(now.year, now.month, now.day, parsed.hour, parsed.minute);
    }).toList();

    /// Next Day Fajr add
    DateTime fajrNext = DateFormat("hh:mm a").parse(prayer.fajr);

    parsedTimes.add(
      DateTime(
        now.year,
        now.month,
        now.day + 1,
        fajrNext.hour,
        fajrNext.minute,
      ),
    );

    for (final t in parsedTimes) {
      if (t.isAfter(now)) {
        final diff = t.difference(now);

        final hr = diff.inHours;
        final min = diff.inMinutes % 60;

        return "$hr HR $min MIN";
      }
    }

    return "--";
  }

  static Stream<String> nextPrayerStream(PrayerModel? prayer) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) => getNextPrayerCountdown(prayer),
    );
  }
}
