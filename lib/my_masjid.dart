import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'features/hadith/auto_scroll_text.dart';
import 'features/hadith/hadith_provider.dart';

class MyMasjid extends ConsumerStatefulWidget {
  const MyMasjid({super.key});

  @override
  ConsumerState<MyMasjid> createState() => _MyMasjidState();
}


class _MyMasjidState extends ConsumerState<MyMasjid> {

  @override
  Widget build(BuildContext context) {
    final hadith = ref.watch(hadithProvider);

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

                                    // "In the Name of Allah, the Most Beneficent, the Most Merciful.",
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
                                        fontSize: 11.sp,
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






                        /// Mobile icon section
                        /// Don't Delete this
                        // Expanded(
                        //   flex: 10,
                        //   child: Center(
                        //     child: Icon(
                        //       Icons.phone_iphone,
                        //       size: 90.sp,
                        //       color: Colors.grey.shade400,
                        //     ),
                        //   ),
                        // ),



                        /// Text section
                        /// Don't Delete this
                        // Expanded(
                        //   flex: 13,
                        //   child: Padding(
                        //     padding: EdgeInsets.fromLTRB(0.w, 2.w, 2.w, 4.w),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           "STAY CONNECTED WITH",
                        //           style: TextStyle(
                        //             fontSize: 8.sp,
                        //             color: Colors.black,
                        //             height: 2.h,
                        //           ),
                        //         ),
                        //
                        //         Text(
                        //           "Your Masjid",
                        //           style: TextStyle(
                        //             fontSize: 13.sp,
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.black,
                        //             height: 1.h,
                        //           ),
                        //         ),
                        //         GridView.builder(
                        //           padding: EdgeInsets.zero,
                        //           shrinkWrap: true,
                        //           physics: NeverScrollableScrollPhysics(),
                        //           itemCount: 4,
                        //           gridDelegate:
                        //               SliverGridDelegateWithFixedCrossAxisCount(
                        //                 crossAxisCount: 2,
                        //                 childAspectRatio: 6,
                        //               ),
                        //           itemBuilder: (context, index) {
                        //             List titles = [
                        //               "Prayer Timetable",
                        //               "Announcements",
                        //               "Donations",
                        //               "Events & More",
                        //             ];
                        //
                        //             List icons = [
                        //               Icons.access_time,
                        //               Icons.campaign,
                        //               Icons.volunteer_activism,
                        //               Icons.event,
                        //             ];
                        //
                        //             return Row(
                        //               children: [
                        //                 Container(
                        //                   child: Icon(
                        //                     icons[index],
                        //                     size: 8.sp,
                        //                     color: Colors.blue,
                        //                   ),
                        //                 ),
                        //                 SizedBox(width: 1.w),
                        //
                        //                 Text(
                        //                   titles[index],
                        //                   style: TextStyle(
                        //                     fontWeight: FontWeight.w600,
                        //                     fontSize: 4.sp,
                        //                     color: Colors.blue,
                        //                   ),
                        //                   overflow: TextOverflow.ellipsis,
                        //                 ),
                        //               ],
                        //             );
                        //           },
                        //         ),
                        //         SizedBox(height: 1.w),
                        //         Row(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             /// 🔹 Logo
                        //             Container(
                        //               child: Image.asset(
                        //                 'assets/images/athan.webp',
                        //                 height: 30.h,
                        //                 width: 30.w,
                        //                 fit: BoxFit.contain,
                        //               ),
                        //               color: Colors.red,
                        //             ),
                        //
                        //             SizedBox(width: 2.w),
                        //
                        //             /// 🔹 Text Area
                        //             Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 DefaultTextStyle(
                        //                   style: TextStyle(
                        //                     fontSize: 6.sp,
                        //                     color: Colors.black,
                        //                   ),
                        //                   child: Text.rich(
                        //                     TextSpan(
                        //                       children: [
                        //                         TextSpan(text: 'Download the '),
                        //                         TextSpan(
                        //                           text: 'Athan+ phone app',
                        //                           style: TextStyle(
                        //                             color: Colors.blue,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ),
                        //
                        //                 SizedBox(height: 1.h),
                        //
                        //                 DefaultTextStyle(
                        //                   style: TextStyle(
                        //                     fontSize: 5.sp,
                        //                     color: Colors.black,
                        //                   ),
                        //                   child: Text.rich(
                        //                     TextSpan(
                        //                       children: [
                        //                         TextSpan(text: 'SEARCH FOR '),
                        //                         TextSpan(
                        //                           text: 'Athan+ MASJIDAL',
                        //                           style: TextStyle(
                        //                             color: Colors.blue,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ],
                        //         ),
                        //         Expanded(
                        //           child: Row(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               /// 🔹 QR + Scan Text
                        //               Column(
                        //                 mainAxisSize:
                        //                     MainAxisSize.min, // 🔥 MUST
                        //                 children: [
                        //                   QrImageView(
                        //                     data: "https://google.com",
                        //                     version: QrVersions.auto,
                        //                     size: 35.w,
                        //                   ),
                        //
                        //                   SizedBox(height: 1.h),
                        //
                        //                   // 🔥 Prevent text overflow
                        //                   Text(
                        //                     "SCAN TO DOWNLOAD",
                        //                     textAlign: TextAlign.center,
                        //                     style: TextStyle(
                        //                       fontSize: 3.sp,
                        //                       color: Colors.black54,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               SizedBox(width: 10.w),
                        //               Align(
                        //                 alignment: Alignment.bottomCenter,
                        //                 child: Row(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children: [
                        //                     Image.asset(
                        //                       'assets/images/app_store_pic.png',
                        //                       height: 20.h,
                        //                       fit: BoxFit.contain,
                        //                     ),
                        //
                        //                     SizedBox(width: 6.w),
                        //
                        //                     Image.asset(
                        //                       'assets/images/play_store_pic.png',
                        //                       height: 20.h,
                        //                       fit: BoxFit.contain,
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  /// PRAYER TABLE SECTION
            Expanded(
                flex: 10,
                child: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(2.w),

                    child: LayoutBuilder(
                        builder: (context, constraints) {

                          double rowHeight = constraints.maxHeight / 4;
                          return Table(

                            border: TableBorder.all(
                              color: Colors.white30,
                              width: 1,
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

                              tableRow(["", "FAJR", "DHUHR", "ASR", "MAGHRIB", "ISHA"], rowHeight, true),

                              tableRow(["STARTS", "5:00", "11:45", "3:35", "5:11", "6:30"], rowHeight),

                              tableRow(["ATHAN", "5:10", "12:45", "3:40", "5:13", "7:00"], rowHeight),

                              tableRow(["IQAMAH", "5:40", "1:15", "4:00", "5:21", "7:30"], rowHeight),
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
                                "JUMADA AL-THANI 1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 7.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "SUNDAY, NOV 23",
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
                          child: Text(
                            "7:49 PM",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "NEXT IQAMAH IN",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 7.sp),
                              ),
                              Text(
                                "9 HR 51 MIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10.sp),
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
                        flex: 11,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "JUMU'AH",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 8.sp),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '1:00 PM',
                                      style: TextStyle(fontSize: 7.sp),
                                    ),
                                    Text(
                                      'STARTS',
                                      style: TextStyle(fontSize: 5.sp),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '1:30 PM',
                                      style: TextStyle(fontSize: 7.sp),
                                    ),
                                    Text(
                                      "JUMU'AH 1",
                                      style: TextStyle(fontSize: 5.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          color: Colors.green,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.wb_twighlight,
                                    size: 12.sp,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "6:18 AM",
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
                                    Icons.free_breakfast,
                                    size: 12.sp,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "5:11 PM",
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
                      Divider(height: 2.h),
                      Expanded(
                        flex: 10,
                        child: Container(
                          color: Colors.green,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.wb_sunny, size: 12.sp),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "6:18 AM",
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
                                  Icon(Icons.nights_stay, size: 12.sp),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "5:11 PM",
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
                fontSize: isHeader ? 5.sp : 9.sp,
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


