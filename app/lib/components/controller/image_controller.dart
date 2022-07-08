import 'package:app/components/model/image_model.dart';
import 'package:app/service/api/image_api.dart';
import 'package:get/get.dart';

class ImageController extends GetxController with StateMixin<List<ImageModel>> {

  var images = <ImageModel>[].obs;
  int get countImages => images.length;
  var loadImages = true.obs;

  @override
  void onInit() {
    print('onInit - ImageController');

    fetchData();
    super.onInit();
  }

  fetchData() async {
    images.clear();

    final data = await ImageApi().fetchImages();

    if (data != null) {
      images.value = data;
    }

    loadImages.value = false;
    update();
  }
}