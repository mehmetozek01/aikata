import 'package:aikata_v2/constants/consts.dart';
import 'package:aikata_v2/controller/auth_controller.dart';
import 'package:aikata_v2/screens/home/home.dart';
import 'package:aikata_v2/widgets/applogo_widget.dart';
import 'package:aikata_v2/widgets/bg_widget.dart';
import 'package:aikata_v2/widgets/custom_text_field.dart';
import 'package:aikata_v2/widgets/our_button.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
  bool _isValidEmail(String email) {
    // Basic email format validation
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
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
                Obx(
                  () => Column(
                    children: [
                      customTextField(
                          hint: nameHint,
                          title: name,
                          controller: nameController,
                          isPass: false),
                      customTextField(
                          hint: emailHint,
                          title: email,
                          controller: emailController,
                          isPass: false),
                      customTextField(
                          hint: passwordHint,
                          title: password,
                          controller: passwordController,
                          isPass: true),
                      customTextField(
                          hint: passwordHint,
                          title: retypePassword,
                          controller: passwordRetypeController,
                          isPass: true),
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
                      controller.isloading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(turuncu),
                            )
                          : ourButton(
                              color: isCheck == true ? turuncu : lightGrey,
                              title: singup,
                              textColor: whiteColor,
                              onPress: () async {
                                if (isCheck != false) {
                                  controller.isloading(true);
                                  if (nameController.text.length < 5) {
                                    VxToast.show(context,
                                        msg:
                                            "İsim en az 5 karakter uzunluğunda olmalıdır.");
                                    return;
                                  }

                                  if (passwordController.text.length < 6) {
                                    VxToast.show(context,
                                        msg:
                                            "Şifre en az 6 karakter uzunluğunda olmalıdır.");
                                    return;
                                  }

                                  if (passwordController.text !=
                                      passwordRetypeController.text) {
                                    VxToast.show(context,
                                        msg:
                                            "Şifreler eşleşmiyor. Lütfen tekrar kontrol edin.");
                                    return;
                                  }

                                  if (!_isValidEmail(emailController.text)) {
                                    VxToast.show(context,
                                        msg:
                                            "Geçerli bir e-posta adresi giriniz.");
                                    return;
                                  }

                                  controller.isloading(true);
                                  try {
                                    await controller
                                        .signupMethod(
                                            context: context,
                                            email: emailController.text,
                                            password: passwordController.text)
                                        .then((value) {
                                      return controller.storeUserData(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                      );
                                    }).then((value) {
                                      Get.offAll(() => const Home());
                                      Fluttertoast.showToast(
                                        msg: "Giriş Başarılı Hoş geldin.👋",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      controller.isloading(false);
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    VxToast.show(context, msg: e.toString());
                                    controller.isloading(false);
                                  }
                                }
                              }).box.width(context.screenWidth - 50).make(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
