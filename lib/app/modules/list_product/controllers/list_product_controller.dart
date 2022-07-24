import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:technicaltest_mobiledev/app/data/product_model.dart';
import 'package:http/http.dart' as http;

class ListProductController extends GetxController {
  //TODO: Implement ListProductController

  Future<List<Products>> getProducts() async {
    List<Products> product = [
      Products(
        id: 1,
        title: "Sweater Kece",
        image: "assets/images/sweater.jpg",
        price: 15000,
      ),
      Products(
        id: 2,
        title: "Sepatu Vans",
        image: "assets/images/sweater.jpg",
        price: 200000,
      ),
    ];
    return product;
  }
}
