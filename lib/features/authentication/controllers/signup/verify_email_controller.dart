import 'package:mindmapify/data/repositories/authentication/authentication_repository.dart';
import 'package:mindmapify/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email Whenever Verify Screen appears & Set timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
  }

  // Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      AppLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
