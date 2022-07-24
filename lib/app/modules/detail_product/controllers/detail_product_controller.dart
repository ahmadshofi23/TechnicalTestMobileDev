import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:technicaltest_mobiledev/app/data/product_model.dart';

class DetailProductController extends GetxController {
  Products products = Get.arguments;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final List<String> size = ["S", "M", "L", "XL"];
  String selectSize = "";
  void clickSizeButton(size) {
    print(size);
    selectSize = size;
    update();
  }

  String selectedGender = "";
  final List<String> gender = ["Male", "Female"];
  String select = "";
  void onClickRadioButton(value) {
    print(value);
    select = value;
    update();
  }

  Future addChart() async {
    try {
      String uid = products.id.toString();
      var data = firestore.collection("transaksi")
        ..doc(uid).set({
          "name": products.title,
          "harga": products.price,
          "images": products.image,
          "jeniskelamin": select,
          "ukuran": selectSize,
          "createAt": DateTime.now().toIso8601String(),
        });

      print(data);
      // clearTextField();
      Get.snackbar("Success", "Create Order");
    } catch (e) {
      Get.snackbar("Warning", "all fields must be filled!!!");
    }
  }
}
