import 'package:atbeach/model/unsplash_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UnsplashController extends GetxController {
  String accessKey = 'W_ppdn1UkX1scf84InuM_gLBPSOTwWRxT8UdYPy6Bg0';
  String secretKey = '';
  var isDataLoadCompleted = false.obs;
  var photos = <UnsplashModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPhotos();
  }

  Future<void> loadPhotos() async {
    String accessAPI =
        'https://api.unsplash.com/search/photos?query=beach&client_id=$accessKey';
    var response = await http.get(Uri.parse(accessAPI));
    if (response.statusCode == 200) {
      var decodeData = json.decode(response.body);
      photos.value = List.from(decodeData).map((e) => UnsplashModel.fromMap(e)).toList();
      isDataLoadCompleted.value = true;
    } else {
      Get.snackbar("Error", "Error fetch API");
    }
  }
}
