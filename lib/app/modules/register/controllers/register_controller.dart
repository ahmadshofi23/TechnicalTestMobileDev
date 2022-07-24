import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  TextEditingController idPhone = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addAccount() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        numberController.text.isNotEmpty) {
      try {
        UserCredential accountCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        if (accountCredential.user != null) {
          String uid = accountCredential.user!.uid;
          var data = firestore.collection("account")
            ..doc(uid).set({
              "fullName": nameController.text,
              "email": emailController.text,
              "password": passwordController.text,
              "phoneNumber": idPhone.text + numberController.text,
              "createAt": DateTime.now().toIso8601String(),
            });

          print(data);
          clearTextField();
          Get.snackbar("Success", "Create Account Success!!!");
        }
      } on FirebaseException catch (e) {
        if (e.code == "weak-password") {
          Get.snackbar("Warning!!!", "Password must be 8 character");
        } else if (e.code == "email-already-in-use") {
          Get.snackbar("Warning!!!", "Email Already, change email");
        } else if (e.code == "wrong-password") {
          Get.snackbar("Warning!!!", "Wrong password");
        } else {
          Get.snackbar("Warning!!!", e.code.toString());
        }
      } catch (e) {
        Get.snackbar("Warning", "all fields must be filled!!!");
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    idPhone.text = "+62";
    super.onInit();
  }

  void clearTextField() {
    nameController.clear();
    passwordController.clear();
    emailController.clear();
    numberController.clear();
  }
}
