import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/unsplash_model.dart';

class UnsplashController extends GetxController {
  var isDataLoadCompleted = false.obs;
  List<dynamic> data = <UnsplashModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPhotos();
  }

  Future<void> loadPhotos() async {
    String accessAPI =
        'https://api.unsplash.com/search/photos?query=beach&client_id=W_ppdn1UkX1scf84InuM_gLBPSOTwWRxT8UdYPy6Bg0';
    var response = await http.get(Uri.parse(accessAPI));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      data = map["results"];
      isDataLoadCompleted.value = true;
    } else {
      Get.snackbar("Error", "Error fetch API");
    }
  }
}
