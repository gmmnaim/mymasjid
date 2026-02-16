import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

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






  Stream<DateTime> getTimeStream() {

    return Stream.periodic(
      const Duration(seconds:1),
          (_)=> DateTime.now(),
    );
  }




  @override
  Widget build(BuildContext context) {
    final hadith = ref.watch(hadithProvider);
    final prayer = ref.watch(prayerProvider);



    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          children: [
            /// LEFT BIG SECTION
            Expanded(
              flex: 11,
              child: Column(
                children: [
                  /// TOP INFO SECTION
                  Expanded(
                    flex: 23,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 23,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 6.h,
                            ),
                            color: Colors.white,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                /// 🔵 BISMILLAH
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    //englishNarrator
                                    hadith?.englishNarrator ?? "",

                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 7.sp,
                                      color: Colors.black87,
                                      height: 1.3,
                                    ),
                                  ),
                                ),

                                /// 🔵 AYAT TEXT
                                Expanded(
                                  child: Center(
                                    child: AutoScrollText(
                                      text: hadith?.hadithEnglish ?? "",
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),





                                  // "Why did they not humble themselves when We made them suffer? "
                                      //     "Instead, their hearts were hardened, and Satan made their "
                                      //     "misdeeds appealing to them.",


                                ),

                                /// 🔵 REFERENCE
                                Text(
                                  //bookSlug
                                  hadith?.bookSlug ?? "",

                                  // "Qur'an 6:43",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    color: Colors.black54,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  /// PRAYER TABLE SECTION
                  Expanded(

                    flex: 10,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                         Radius.circular(15.r)
                          
                        )
                      ),
                      

                      child: LayoutBuilder(
                        builder: (context, constraints) {

                          // ✅ NOW TOTAL ROW = 2
                          double rowHeight = constraints.maxHeight / 2;

                          return Table(

                            border: TableBorder.all(
                              color: Colors.white,
                              width: 1.w,
                            ),

                            columnWidths: const {
                              0: FlexColumnWidth(1.5),
                              1: FlexColumnWidth(),
                              2: FlexColumnWidth(),
                              3: FlexColumnWidth(),
                              4: FlexColumnWidth(),
                              5: FlexColumnWidth(),
                            },

                            children: [

                              tableRow(
                                ["", "FAJR", "DUHR", "ASR", "MAGHRIB", "ISHA"],
                                rowHeight,
                                true,
                              ),

                              tableRow(
                                [
                                  "STARTS",
                                  prayer?.fajr ?? "--",
                                  prayer?.dhuhr ?? "--",
                                  prayer?.asr ?? "--",
                                  prayer?.maghrib ?? "--",
                                  prayer?.isha ?? "--",
                                ],
                                rowHeight,
                              ),


                            ],
                          );
                        },
                      ),
                    ),
                  ),






                ],
              ),
            ),

            /// VERTICAL DIVIDER
            Container(width: 2.w, color: Colors.black),

            /// RIGHT TIME SECTION
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(left: 2.w, right: 2.w),
                child: Container(
                  color: Colors.white,
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
                                  color: Colors.black,
                                ),
                              ),

                              Text(
                                "${prayer?.weekday ?? "--"}, ${prayer?.date ?? "--"}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 7.sp,
                                  color: Colors.black,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180.h,
                        height: 1.w,
                        child: Center(child: Container(color: Colors.black)),
                      ),
                      Expanded(
                        flex: 8,
                        child: Center(
                          child: StreamBuilder<DateTime>(
                            stream: getTimeStream(),
                            builder: (context, snapshot) {

                              if(!snapshot.hasData){
                                return const SizedBox();
                              }

                              final time = DateFormat('hh:mm a')
                                  .format(snapshot.data!);

                              return Text(
                                time,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),




                          // Text(
                          //   "7:49 PM",
                          //   style: TextStyle(
                          //     fontSize: 15.sp,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
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
                                style: TextStyle(fontSize: 6.sp),
                              ),

                              StreamBuilder<String>(

                                stream: NextPrayerCalculator.nextPrayerStream(prayer),

                                builder: (context, snapshot) {

                                  return Text(
                                    snapshot.data ?? "--",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 9.sp),
                                  );

                                },

                              )


                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180.h,
                        height: 1.w,
                        child: Center(child: Container(color: Colors.black)),
                      ),
                      Expanded(
                        flex: 9,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "JUMU'AH",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 6.sp),
                              ),
                            ),
                            Center(
                              child: Text(
                                  prayer?.jumuah ?? "--",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 9.sp),
                              ),
                            ),





                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Column(
                            //       children: [
                            //         Text(
                            //           '1:00 PM',
                            //           style: TextStyle(fontSize: 7.sp),
                            //         ),
                            //         Text(
                            //           'STARTS',
                            //           style: TextStyle(fontSize: 5.sp),
                            //         ),
                            //       ],
                            //     ),
                            //     Column(
                            //       children: [
                            //         Text(
                            //           '1:30 PM',
                            //           style: TextStyle(fontSize: 7.sp),
                            //         ),
                            //         Text(
                            //           "JUMU'AH 1",
                            //           style: TextStyle(fontSize: 5.sp),
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(

                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r),
                            )
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.nightlight_round,
                                    size: 12.sp,
                                    color: Color(0xFFE1F5FE),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                      prayer?.saheri ?? "--",
                                    style: TextStyle(fontSize: 6.sp),
                                  ),
                                  Text(
                                    "SEHRI",
                                    style: TextStyle(fontSize: 3.sp),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.restaurant,
                                    size: 12.sp,
                                    color: Color(0xFFFFF9C4),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                      prayer?.iftar ?? "--",
                                    style: TextStyle(fontSize: 6.sp),
                                  ),
                                  Text(
                                    "IFTAR",
                                    style: TextStyle(fontSize: 3.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 2.h),
                      Expanded(
                        flex: 10,
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:BorderRadius.only(
                              bottomLeft: Radius.circular(15.r),
                              bottomRight: Radius.circular(15.r),
                            )
                          ),

                           child:

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.wb_sunny_outlined, size: 12.sp,
                                  color: Colors.amberAccent,

                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                      prayer?.sunrise ?? "--",
                                    style: TextStyle(fontSize: 6.sp),
                                  ),
                                  Text(
                                    "SUNRISE",
                                    style: TextStyle(fontSize: 3.sp),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.brightness_3, size: 12.sp,
                                  color: Color(0xFFFFAB91),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                      prayer?.sunset ?? "--",
                                    style: TextStyle(fontSize: 6.sp),
                                  ),
                                  Text(
                                      "SUNSET",
                                    style: TextStyle(fontSize: 3.sp),
                                  ),
                                ],
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
    );
  }
}

TableRow tableRow(List<String> data, double height, [bool isHeader = false]) {

  return TableRow(
    children: data.map((text) {

      return SizedBox(    // 🔥 THIS IS THE MAGIC
        height: height,

        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: isHeader ? 7.sp : 7.sp,
                fontWeight:
                isHeader ? FontWeight.bold : FontWeight.w600,
                height: 1,
              ),
            ),
          ),
        ),
      );

    }).toList(),
  );
}


