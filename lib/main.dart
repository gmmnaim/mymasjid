import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mymasjid/my_masjid.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'features/hadith/hadith_model.dart';
import 'features/prayer/prayer_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HadithModelAdapter());

  await Hive.openBox<HadithModel>('hadithBox');
  Hive.registerAdapter(PrayerModelAdapter());

  await Hive.openBox<PrayerModel>('prayerBox');

  await WakelockPlus.enable();

  SystemChannels.platform.invokeMethod(
      'SystemNavigator.setFrameworkHandlesBack', true);



  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800), // Pixel 9 logical size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const MyMasjid(),
    );

  }
}
