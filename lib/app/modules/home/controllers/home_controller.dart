import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxInt data = 0.obs;

  void decrement() {
    data--;
    simpanData();
  }

  void increment() {
    data++;
    simpanData();
  }

  void simpanData() async {
    print("SIMPAN DATA");
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('angkaTerakhir') != null) {
      await prefs.remove('angkaTerakhir');
    }
    await prefs.setInt('angkaTerakhir', data.value);
  }

  void bacaData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('angkaTerakhir') != null) {
      data.value = prefs.getInt('angkaTerakhir')!;
    }
  }

  void resetData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('angkaTerakhir') != null) {
      await prefs.remove('angkaTerakhir');
      data.value = 0;
    }
  }

  @override
  void onInit() {
    bacaData();
    super.onInit();
  }
}
