import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:technicaltest_mobiledev/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> authLogin() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        Get.snackbar("Success", "Login Success");
        Get.offAllNamed(Routes.LIST_PRODUCT);
      } on FirebaseException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Warning", "Email belum terdaftar");
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Warning!!!", "Password yang anda masukkan salah");
        }
      } catch (e) {
        Get.snackbar("Warning!!!", "Tidak dapat login");
      }
    } else {
      Get.snackbar("Warning!!!", "Email dan password harus di isi");
    }
  }
}
