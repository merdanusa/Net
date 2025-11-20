import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  RxString token = ''.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
  }

  void saveToken(String newToken) {
    token.value = newToken;
    box.write('token', newToken);
  }

  void clearToken() {
    token.value = '';
    box.remove('token');
  }

  bool get isLoggedIn => token.value.isNotEmpty;
}
