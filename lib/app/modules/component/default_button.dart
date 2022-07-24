import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:technicaltest_mobiledev/utils/styleColor.dart';

import '../../../utils/size_config.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  String text;
  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(60),
      width: Get.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: blueColor,
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(fontSize: getProportionateScreenWidth(36)),
        ),
      ),
    );
  }
}
