import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'features/hadith/auto_scroll_text.dart';
import 'features/hadith/hadith_provider.dart';
import 'features/prayer/prayer_model.dart';
import 'features/prayer/prayer_provider.dart';
import 'next_prayer_calculator.dart';

class MyMasjid extends ConsumerStatefulWidget {
  const MyMasjid({super.key});

  @override
  ConsumerState<MyMasjid> createState() => _MyMasjidState();
}

class _MyMasjidState extends ConsumerState<MyMasjid> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(prayerProvider.notifier).loadPrayer();
    });

    Future.microtask(() {
      ref.read(hadithProvider.notifier).loadHadith();
    });
  }

  Stream<DateTime> getTimeStream() {
    return Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final hadith = ref.watch(hadithProvider);
    final prayer = ref.watch(prayerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C10),
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [Color(0xFF14161C), Color(0xFF0D0F14), Color(0xFF08090C)],
        //   ),
        // ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Row(
            children: [
              /// LEFT BIG SECTION
              Expanded(
                flex: 11,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.w, right: 2.w),
                  child: Column(
                    children: [
                      /// TOP INFO SECTION
                      Expanded(
                        flex: 24,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0B0C10),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  hadith?.englishNarrator ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 7.sp,
                                    color: Colors.white70,
                                    height: 1.3,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Center(
                                  child: AutoScrollText(
                                    text: hadith?.hadithEnglish ?? "",
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ),

                              Text(
                                hadith?.bookSlug ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  color: Colors.white54,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// PRAYER TABLE SECTION
                      Expanded(
                        flex: 7,
                        child: Container(
                          margin: EdgeInsets.only(top: 2.w, right: 4.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1F26),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double rowHeight = constraints.maxHeight / 2;

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  // border: TableBorder(
                                  //
                                  //   horizontalInside: BorderSide(
                                  //     color: Colors.white24, // row divider
                                  //     width: 1.5 / MediaQuery.of(context).devicePixelRatio,
                                  //
                                  //   ),
                                  //   verticalInside: BorderSide(
                                  //     color: const Color(0xFF0B0C10), // dark column divider
                                  //     width: 1.5 / MediaQuery.of(context).devicePixelRatio,
                                  //   ),
                                  // ),
                                  columnWidths: const {
                                    0: FlexColumnWidth(1.5),
                                    1: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                    3: FlexColumnWidth(),
                                    4: FlexColumnWidth(),
                                    5: FlexColumnWidth(),
                                  },
                                  children: [
                                    tableRowUI(
                                      [
                                        "AWQAT",
                                        "FAJR",
                                        "DUHR",
                                        "ASR",
                                        "MAGHRIB",
                                        "ISHA",
                                      ],
                                      rowHeight,
                                      true,
                                    ),
                                    tableRowUI(
                                      [
                                        "STARTS",
                                        prayer?.fajr ?? "--",
                                        prayer?.dhuhr ?? "--",
                                        prayer?.asr ?? "--",
                                        prayer?.maghrib ?? "--",
                                        prayer?.isha ?? "--",
                                      ],
                                      rowHeight,
                                      false,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(flex: 6, child: Container()),
                    ],
                  ),
                ),
              ),

              /// VERTICAL DIVIDER
              Container(width: 1.w, color: Colors.white24),

              /// RIGHT TIME SECTION
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.w, right: 0.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B0C10),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  prayer?.hijriDate ?? "--",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 6.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  "${prayer?.weekday ?? "--"}, ${prayer?.date ?? "--"}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 7.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 180.h,
                          height: 1.w,
                          child: Center(
                            child: Container(color: Colors.white24),
                          ),
                        ),

                        Expanded(
                          flex: 8,
                          child: Center(
                            child: StreamBuilder<DateTime>(
                              stream: getTimeStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const SizedBox();
                                }

                                final time = DateFormat(
                                  'hh:mm a',
                                ).format(snapshot.data!);

                                return Text(
                                  time,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 9,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "NEXT PRAYER IN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 6.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                                StreamBuilder<String>(
                                  stream: NextPrayerCalculator.nextPrayerStream(
                                    prayer,
                                  ),
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data ?? "--",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 180.h,
                          height: 1.w,
                          child: Center(
                            child: Container(color: Colors.white24),
                          ),
                        ),

                        Expanded(
                          flex: 12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "JUMU'AH",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 6.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  prayer?.jumuah ?? "--",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 10,
                          child: Container(
                            margin: EdgeInsets.only(left: 4.w),
                            decoration: BoxDecoration(
                              //borderRadius: BorderRadius.circular(15.r),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r),
                              ),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF1B1E25), Color(0xFF14161C)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                infoColumn(
                                  Icons.nightlight_round,
                                  prayer?.saheri ?? "--",
                                  "SEHRI",
                                ),
                                infoColumn(
                                  Icons.restaurant,
                                  prayer?.iftar ?? "--",
                                  "IFTAR",
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 4.w),
                          child: Divider(height: 2.h, color: Colors.white24),
                        ),

                        Expanded(
                          flex: 9,
                          child: Container(
                            margin: EdgeInsets.only(left: 4.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r),
                              ),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF1B1E25),
                                  Color(0xFF14161C),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                infoColumn(
                                  Icons.wb_sunny_outlined,
                                  prayer?.sunrise ?? "--",
                                  "SUNRISE",
                                ),
                                infoColumn(
                                  Icons.brightness_3,
                                  prayer?.sunset ?? "--",
                                  "SUNSET",
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget infoColumn(IconData icon, String time, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: Colors.white70),
      SizedBox(height: 1),
      Text(time, style: const TextStyle(color: Colors.white)),
      Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
    ],
  );
}

TableRow tableRow(List<String> data, double height, [bool isHeader = false]) {
  return TableRow(
    children: data.map((text) {
      return SizedBox(
        height: height,
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 7.sp,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.w600,
                height: 1,
              ),
            ),
          ),
        ),
      );
    }).toList(),
  );
}

TableRow tableRowUI(List<String> data, double height, bool header) {
  return TableRow(
    children: List.generate(data.length, (index) {
      return Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1B1E25), Color(0xFF14161C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border(
            top: header
                ? BorderSide.none
                : const BorderSide(color: Colors.white24, width: 1),
            left: index == 0
                ? BorderSide.none
                : const BorderSide(color: Color(0xFF0B0C10), width: 1),
          ),
        ),
        child: Text(
          data[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: header ? 6.sp : 7.sp,
            color: header ? Colors.white70 : Colors.white,
            fontWeight: header ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      );
    }),
  );
}
