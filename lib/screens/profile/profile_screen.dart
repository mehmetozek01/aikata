import 'dart:io';

import 'package:aikata_v2/constants/consts.dart';
import 'package:aikata_v2/constants/lists.dart';
import 'package:aikata_v2/controller/auth_controller.dart';
import 'package:aikata_v2/controller/profile_controller.dart';
import 'package:aikata_v2/screens/auth/signin/sign_in.dart';
import 'package:aikata_v2/widgets/custom_text_field.dart';
import 'package:aikata_v2/widgets/our_button.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                //Profile Image
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: controller.profileImgPath.isEmpty
                            ? Image.asset(logo, width: 100, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make()
                            : Image.file(
                                File(controller.profileImgPath.value),
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                      ),
                    ),
                    Positioned(
                      width: context.screenWidth + 80,
                      bottom: -12,
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            isScrollControlled: true,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(35),
                              ),
                            ),
                            builder: (context) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                      color: Colors.grey,
                                      width: 30,
                                      height: 2,
                                    ),
                                  ),
                                  const Spacer(),
                                  10.heightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.changeImage(context);
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 32,
                                          child: Icon(
                                            IconlyBold.image,
                                            color: fontGrey,
                                            size: 60,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 32,
                                          child: Icon(
                                            IconlyBold.camera,
                                            color: fontGrey,
                                            size: 60,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 32,
                                          child: Icon(
                                            IconlyBold.camera,
                                            color: fontGrey,
                                            size: 60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  15.heightBox,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ourButton(
                                        color: turuncu,
                                        onPress: () {},
                                        textColor: whiteColor,
                                        title: "Kaydet",
                                      ),
                                      50.widthBox,
                                      ourButton(
                                        color: fontGrey,
                                        onPress: () {
                                          Get.back();
                                        },
                                        textColor: whiteColor,
                                        title: "İptal",
                                      )
                                    ],
                                  ),
                                  20.heightBox
                                ],
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          IconlyBold.editSquare,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                //name email
                20.heightBox,
                Column(
                  children: [
                    "Mehmet Özek".text.black.size(25).bold.make(),
                    5.heightBox,
                    "ozekv100@gmail.com".text.black.size(16).make()
                  ],
                ),
                //orders
                40.heightBox,
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "00"
                                  .text
                                  .fontFamily(bold)
                                  .color(darkFontGrey)
                                  .size(16)
                                  .make(),
                              5.heightBox,
                              "in your cart"
                                  .text
                                  .align(TextAlign.center)
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make()
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "00"
                                .text
                                .fontFamily(bold)
                                .color(darkFontGrey)
                                .size(16)
                                .make(),
                            5.heightBox,
                            "in your cart"
                                .text
                                .align(TextAlign.center)
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "00"
                                  .text
                                  .fontFamily(bold)
                                  .color(darkFontGrey)
                                  .size(16)
                                  .make(),
                              5.heightBox,
                              "in your cart"
                                  .text
                                  .align(TextAlign.center)
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ).box.white.rounded.margin(const EdgeInsets.all(8)).make(),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: lightGrey,
                    );
                  },
                  itemCount: profileButtonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(profileButtonIcon[index]),
                      title: profileButtonList[index]
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      trailing: const Icon(
                        IconlyLight.arrowRight2,
                      ),
                    );
                  },
                )
                    .box
                    .white
                    .rounded
                    .margin(const EdgeInsets.all(8))
                    .padding(const EdgeInsets.symmetric(horizontal: 16))
                    .make(),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: lightGrey,
                    );
                  },
                  itemCount: profilEdit.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            showModalBottomSheet(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(35),
                                ),
                              ),
                              builder: (context) => SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 4),
                                  height: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom +
                                      MediaQuery.of(context).size.height * .40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          color: Colors.grey,
                                          width: 30,
                                          height: 2,
                                        ),
                                      ),
                                      30.heightBox,
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 24, right: 24),
                                        child: Column(
                                          children: [
                                            customTextField2(
                                              isPass: false,
                                              hint: nameHint,
                                              title: name,
                                            ),
                                            30.heightBox,
                                            customTextField2(
                                              isPass: false,
                                              hint: emailHint,
                                              title: email,
                                            ),
                                          ],
                                        ),
                                      ),
                                      30.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ourButton(
                                            color: turuncu,
                                            onPress: () {},
                                            textColor: whiteColor,
                                            title: "Kaydet",
                                          ),
                                          50.widthBox,
                                          ourButton(
                                            color: fontGrey,
                                            onPress: () {
                                              Get.back();
                                            },
                                            textColor: whiteColor,
                                            title: "İptal",
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                            break;
                          default:
                        }
                      },
                      leading: Icon(profilEditIcon[index]),
                      title: profilEdit[index]
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      trailing: const Icon(
                        IconlyLight.arrowRight2,
                      ),
                    );
                  },
                )
                    .box
                    .white
                    .rounded
                    .margin(const EdgeInsets.all(8))
                    .padding(const EdgeInsets.symmetric(horizontal: 16))
                    .make(),
                10.heightBox,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: turuncu,
                    padding: const EdgeInsets.all(12),
                  ),
                  onPressed: () async {
                    await Get.put(AuthController()).signoutMethod(context);
                    Get.offAll(() => const SignIn());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        IconlyLight.logout,
                        color: Colors.white,
                      ),
                      20.widthBox,
                      "Çıkış Yap".text.white.size(18).fontFamily(bold).make(),
                    ],
                  ),
                ).box.rounded.size(context.screenWidth - 25, 50).make(),

                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("data"),
      onPressed: () {
        showModalBottomSheet(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          isScrollControlled: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35),
            ),
          ),
          builder: (context) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            height: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    color: Colors.grey,
                    width: 30,
                    height: 2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    "Sort & Filter",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: primaryColor,
                    ),
                  ),
                ),
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
