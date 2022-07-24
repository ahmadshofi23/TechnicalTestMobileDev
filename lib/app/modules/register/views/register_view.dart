import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:technicaltest_mobiledev/app/modules/component/default_button.dart';
import 'package:technicaltest_mobiledev/app/modules/component/text_from_field.dart';
import 'package:technicaltest_mobiledev/app/modules/component/text_from_field_password.dart';
import 'package:technicaltest_mobiledev/app/routes/app_pages.dart';
import 'package:technicaltest_mobiledev/utils/size_config.dart';
import 'package:technicaltest_mobiledev/utils/styleColor.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var heightBody = Get.height - AppBar().preferredSize.height;
    return Scaffold(
      backgroundColor: Color(0xffBDE6F1),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
            size: getProportionateScreenHeight(32),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: Get.width,
        height: Get.height - AppBar().preferredSize.height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: heightBody * 0.01,
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
                  top: heightBody * 0.30,
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
                        CustomTextFromField(
                            controller: controller.nameController,
                            hintext: "Nama Lengkap",
                            icon: Icon(Icons.people_outline)),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
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
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                readOnly: true,
                                controller: controller.idPhone,
                                decoration: const InputDecoration(
                                  prefixIconColor: Colors.grey,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                                flex: 5,
                                fit: FlexFit.loose,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: getProportionateScreenWidth(20)),
                                  child: CustomTextFromField(
                                    controller: controller.numberController,
                                    textInputType: TextInputType.number,
                                    hintext: "Nomor HP",
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        DefaultButton(
                            text: "Buat Akun",
                            press: () => controller.addAccount()),
                        SizedBox(
                          height: getProportionateScreenWidth(52),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
