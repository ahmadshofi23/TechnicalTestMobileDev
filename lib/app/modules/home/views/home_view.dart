import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:technicaltest_mobiledev/app/modules/component/default_button.dart';
import 'package:technicaltest_mobiledev/app/modules/component/text_from_field.dart';
import 'package:technicaltest_mobiledev/app/modules/component/text_from_field_password.dart';
import 'package:technicaltest_mobiledev/app/routes/app_pages.dart';
import 'package:technicaltest_mobiledev/utils/size_config.dart';
import 'package:technicaltest_mobiledev/utils/styleColor.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var heightBody = Get.height - AppBar().preferredSize.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            ),
          ),
        ),
        backgroundColor: backgroundColor,
        body: Container(
          width: Get.width,
          height: Get.height - AppBar().preferredSize.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: heightBody * 0.1,
                      left: getProportionateScreenWidth(40)),
                  child: Text(
                    "Form Login",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(60),
                        color: blueColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: heightBody * 0.45,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(40),
                        right: getProportionateScreenWidth(40),
                        top: getProportionateScreenHeight(80),
                        bottom: getProportionateScreenHeight(40),
                      ),
                      child: Column(
                        children: [
                          // SizedBox(
                          //   height: 10,
                          // ),
                          CustomTextFromField(
                              controller: controller.emailController,
                              hintext: "Email",
                              icon: const Icon(Icons.email_outlined)),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          CustomeTextFormFieldPassword(
                            controller: controller.passwordController,
                            hintext: "Password",
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          DefaultButton(
                            text: "Masuk",
                            press: () {
                              controller.authLogin();
                            },
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.REGISTER),
                            child: Text(
                              "Buat Akun",
                              style: TextStyle(
                                color: blackColor,
                                fontSize: getProportionateScreenWidth(32),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
