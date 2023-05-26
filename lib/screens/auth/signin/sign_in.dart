import 'package:aikata_v2/constants/colors.dart';
import 'package:aikata_v2/constants/lists.dart';
import 'package:aikata_v2/constants/strings.dart';
import 'package:aikata_v2/constants/styles.dart';
import 'package:aikata_v2/screens/auth/signup/sign_up.dart';
import 'package:aikata_v2/screens/home/home.dart';
import 'package:aikata_v2/widgets/applogo_widget.dart';
import 'package:aikata_v2/widgets/bg_widget.dart';
import 'package:aikata_v2/widgets/custom_text_field.dart';
import 'package:aikata_v2/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.12).heightBox,
              applogoWidget(),
              15.heightBox,
              "Yeni sezon trend ürünler seni bekliyor"
                  .text
                  .fontFamily(bold)
                  .white
                  .size(17)
                  .make(),
              30.heightBox,
              Column(
                children: [
                  customTextField(hint: emailHint, title: email),
                  customTextField(hint: passwordHint, title: password),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPass.text.make(),
                    ),
                  ),
                  5.heightBox,
                  ourButton(
                      color: turuncu,
                      title: login,
                      textColor: whiteColor,
                      onPress: () {
                        Get.to(() => const Home());
                      }).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                    color: whiteColor,
                    title: singup,
                    textColor: turuncu,
                    onPress: () {
                      Get.to(() => const SignUp());
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: lightGrey,
                          radius: 25,
                          child: Image.asset(
                            socialIconList[index],
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(
                    const EdgeInsets.all(16),
                  )
                  .width(context.screenWidth - 70)
                  .outerShadowMd
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
