import 'package:get/get.dart';


class GoogleFitController extends GetxController {
  var steps = 0.obs;
  var calories = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGoogleFitData();
  }

  void fetchGoogleFitData() async {


  }
}
