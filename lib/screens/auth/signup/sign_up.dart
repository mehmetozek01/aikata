import 'package:aikata_v2/constants/colors.dart';
import 'package:aikata_v2/constants/strings.dart';
import 'package:aikata_v2/constants/styles.dart';
import 'package:aikata_v2/widgets/applogo_widget.dart';
import 'package:aikata_v2/widgets/bg_widget.dart';
import 'package:aikata_v2/widgets/custom_text_field.dart';
import 'package:aikata_v2/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? isCheck = false;

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
                  customTextField(hint: nameHint, title: name),
                  customTextField(hint: emailHint, title: email),
                  customTextField(hint: passwordHint, title: password),
                  customTextField(hint: passwordHint, title: retypePassword),
                  10.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        activeColor: turuncu,
                        checkColor: whiteColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        },
                      ),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Onaylıyorum ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                ),
                              ),
                              TextSpan(
                                text: termAndCond,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                ),
                              ),
                              TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                ),
                              ),
                              TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  5.heightBox,
                  ourButton(
                          color: isCheck == true ? turuncu : lightGrey,
                          title: singup,
                          textColor: whiteColor,
                          onPress: () {})
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  10.heightBox,
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey,
                          ),
                        ),
                        TextSpan(
                          text: " ",
                        ),
                        TextSpan(
                          text: login,
                          style: TextStyle(
                            fontFamily: bold,
                            color: redColor,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(
                    () {
                      Get.back();
                    },
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
