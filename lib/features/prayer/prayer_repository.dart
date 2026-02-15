import 'package:hive/hive.dart';
import 'package:mymasjid/features/prayer/prayer_model.dart';
import 'package:mymasjid/features/prayer/prayer_service.dart';

class PrayerRepository {

  final service = PrayerService();
  final box = Hive.box<PrayerModel>('prayerBox');

  Future<PrayerModel> getPrayer() async {

    try{

      final data = await service.fetchPrayer();

      final prayer = PrayerModel.fromJson(data);

      await box.put('latest', prayer);

      return prayer;

    }catch(e){

      final offline = box.get('latest');

      if(offline!=null){
        return offline;
      }else{
        throw Exception("No Prayer Data");
      }
    }
  }
}
