import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyMasjid extends StatefulWidget {
  const MyMasjid({super.key});

  @override
  State<MyMasjid> createState() => _MyMasjidState();
}

class _MyMasjidState extends State<MyMasjid> {
  @override
  Widget build(BuildContext context) {
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
                        /// Mobile icon section
                        Expanded(
                          flex: 10,
                          child: Center(
                            child: Icon(
                              Icons.phone_iphone,
                              size: 90.sp,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 2.w,
                          child: Container(color: Colors.green),
                        ),

                        /// Text section
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0.w, 2.w, 2.w, 4.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "STAY CONNECTED WITH",
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    color: Colors.black,
                                    height: 2.h
                                  ),
                                ),

                                Text(
                                  "Your Masjid",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    height: 1.h
                                  ),
                                ),
                                GridView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 6,
                                      ),
                                  itemBuilder: (context, index) {
                                    List titles = [
                                      "Prayer Timetable",
                                      "Announcements",
                                      "Donations",
                                      "Events & More",
                                    ];

                                    List icons = [
                                      Icons.access_time,
                                      Icons.campaign,
                                      Icons.volunteer_activism,
                                      Icons.event,
                                    ];

                                    return Row(
                                      children: [
                                        Container(
                                          child: Icon(
                                            icons[index],
                                            size: 8.sp,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(width: 1.w),

                                        Text(
                                          titles[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 4.sp,
                                            color: Colors.blue,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(height: 1.w),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// 🔹 Logo
                                    Container(
                                      child: Image.asset(
                                        'assets/images/athan.webp',
                                        height: 30.h,
                                        width: 30.w,
                                        fit: BoxFit.contain,
                                      ),
                                      color: Colors.red,
                                    ),

                                    SizedBox(width: 2.w),

                                    /// 🔹 Text Area
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DefaultTextStyle(
                                          style: TextStyle(
                                            fontSize: 6.sp,
                                            color: Colors.black,
                                          ),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(text: 'Download the '),
                                                TextSpan(
                                                  text: 'Athan+ phone app',
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 1.h),

                                        DefaultTextStyle(
                                          style: TextStyle(
                                            fontSize: 5.sp,
                                            color: Colors.black,
                                          ),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(text: 'SEARCH FOR '),
                                                TextSpan(
                                                  text: 'Athan+ MASJIDAL',
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      /// 🔹 QR + Scan Text
                                      Column(
                                        mainAxisSize: MainAxisSize.min,   // 🔥 MUST
                                        children: [

                                          QrImageView(
                                            data: "https://google.com",
                                            version: QrVersions.auto,
                                            size: 38.w,
                                          ),

                                          SizedBox(height: 1.h),

                                                              // 🔥 Prevent text overflow

                                          Text(
                                              "SCAN TO DOWNLOAD",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 3.sp,
                                                color: Colors.black54,
                                              ),
                                            ),

                                        ],
                                      ),
                                      SizedBox(width: 10.w),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [

                                            Image.asset(
                                              'assets/images/app_store_pic.png',
                                              height: 20.h,
                                              fit: BoxFit.contain,
                                            ),

                                            SizedBox(width: 6.w),

                                            Image.asset(
                                              'assets/images/play_store_pic.png',
                                              height: 20.h,
                                              fit: BoxFit.contain,
                                            ),
                                          ],
                                        ),
                                      ),





                                    ],
                                  ),
                                )



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
                      color: Colors.green,
                      padding: EdgeInsets.all(3.w),
                      child: Column(
                        children: List.generate(4, (row) {
                          return Expanded(
                            child: Row(
                              children: List.generate(6, (col) {
                                return Expanded(
                                  child: Center(
                                    child: Text(
                                      "TEXT",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 6.sp,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        }),
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
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "JUMADA AL-THANI 1\nSUNDAY, NOV 23",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 5.sp, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.w,
                      child: Center(child: Container(color: Colors.black)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "7:49 PM",
                          style: TextStyle(
                            fontSize: 5.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "NEXT IQAMAH IN\n9 HR 51 MIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 6.sp),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "JUMU'AH\n1:00 PM | 1:30 PM",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 5.sp),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.wb_sunny, size: 5.sp),
                                SizedBox(height: 4.h),
                                Text(
                                  "6:18 AM",
                                  style: TextStyle(fontSize: 5.sp),
                                ),
                                Text(
                                  "SUNRISE",
                                  style: TextStyle(fontSize: 5.sp),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.nights_stay, size: 5.sp),
                                SizedBox(height: 4.h),
                                Text(
                                  "5:11 PM",
                                  style: TextStyle(fontSize: 5.sp),
                                ),
                                Text(
                                  "SUNSET",
                                  style: TextStyle(fontSize: 5.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
