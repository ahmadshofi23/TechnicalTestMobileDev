import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:technicaltest_mobiledev/app/data/product_model.dart';
import 'package:technicaltest_mobiledev/app/modules/component/text_from_field.dart';
import 'package:technicaltest_mobiledev/app/routes/app_pages.dart';
import 'package:technicaltest_mobiledev/utils/size_config.dart';
import 'package:technicaltest_mobiledev/utils/styleColor.dart';

import '../controllers/list_product_controller.dart';

class ListProductView extends GetView<ListProductController> {
  const ListProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: blackColor,
              ))
        ],
        leading: Center(
          child: Text(
            "Shop",
            style: blackTextColor.copyWith(
              fontSize: getProportionateScreenWidth(40),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(20),
            horizontal: getProportionateScreenWidth(30)),
        child: Column(
          children: [
            CustomTextFromField(
              hintext: "Cari Produk",
              icon: Icon(Icons.search),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Expanded(
                child: FutureBuilder<List<Products>>(
              future: controller.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("Tidak ada data..."),
                  );
                }
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: getProportionateScreenHeight(200),
                        childAspectRatio: 3 / 3.6,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (contex, index) {
                      Products products = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_PRODUCT,
                              arguments: products);
                        },
                        child: Container(
                          // color: blueColor,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(8),
                                  vertical: getProportionateScreenHeight(4)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(products.image!),
                                    ),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(5)),
                                  Text(products.title.toString(),
                                      style: blackTextColor.copyWith(
                                        fontSize:
                                            getProportionateScreenWidth(34),
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text("Rp." + products.price.toString(),
                                      style: blackTextColor.copyWith(
                                        fontSize:
                                            getProportionateScreenWidth(34),
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
