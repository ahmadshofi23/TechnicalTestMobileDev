import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:technicaltest_mobiledev/app/data/product_model.dart';
import 'package:technicaltest_mobiledev/app/modules/component/default_button.dart';
import 'package:technicaltest_mobiledev/app/modules/detail_product/views/myRadioButton.dart';
import 'package:technicaltest_mobiledev/utils/size_config.dart';
import 'package:technicaltest_mobiledev/utils/styleColor.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Products product = Get.arguments;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
        centerTitle: true,
        foregroundColor: blackColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30)),
              child: Divider(
                color: blackColor,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(120),
                    ),
                    child: Container(
                      height: getProportionateScreenHeight(300),
                      // width: get,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Image.asset(product.image!),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(20),
                        horizontal: getProportionateScreenWidth(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title.toString(),
                          style: blackTextColor.copyWith(
                            fontSize: getProportionateScreenWidth(36),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Rp." + product.price.toString(),
                          style: blackTextColor.copyWith(
                              fontSize: getProportionateScreenWidth(32)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: blackColor,
              // height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pilih Jenis Kelamin",
                    style: blackTextColor.copyWith(
                        fontSize: getProportionateScreenWidth(32)),
                  ),
                  addRadioButton(0, "Pria"),
                  addRadioButton(1, "Wanita"),
                  // Row(
                  //   children: [
                  //     Radio(value: 1, groupValue: 2, onChanged: (value) {}),
                  //     Text("Wanita"),
                  //   ],
                  // ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pilih ukuran",
                    style: blackTextColor.copyWith(
                        fontSize: getProportionateScreenWidth(32)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30),
                      vertical: getProportionateScreenHeight(10),
                    ),
                    child: Row(
                      children: [
                        customRadio("S", 0),
                        SizedBox(width: getProportionateScreenWidth(10)),
                        customRadio("M", 1),
                        SizedBox(width: getProportionateScreenWidth(10)),
                        customRadio("L", 2),
                        SizedBox(width: getProportionateScreenWidth(10)),
                        customRadio("XL", 3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Divider(
              color: blackColor,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: DefaultButton(
                  text: "+ Keranjang",
                  press: () async {
                    await controller.addChart();
                    Get.defaultDialog(
                        title: "Success",
                        content: Column(
                          children: [
                            Text("produk berhasil di tambahkan"),
                            Text("Cek keranjang mu untuk lihat produk"),
                            DefaultButton(text: "Lihat Keranjang", press: () {})
                          ],
                        ));
                  }),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
          ],
        ),
      ),
    );
  }

  Row addRadioButton(int btnIndex, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GetBuilder<DetailProductController>(
          builder: (_) => Radio(
              activeColor: Colors.blue,
              value: controller.gender[btnIndex],
              groupValue: controller.select,
              onChanged: (value) => controller.onClickRadioButton(value)),
        ),
        Text(title)
      ],
    );
  }

  Widget customRadio(String text, int index) {
    return GetBuilder<DetailProductController>(
      builder: (_) => Container(
        width: getProportionateScreenWidth(100),
        height: getProportionateScreenHeight(50),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor:
                  controller.selectSize == text ? blackColor : whiteColor),
          onPressed: () => controller.clickSizeButton(text),
          child: Text(text),
        ),
      ),
    );
  }
}
