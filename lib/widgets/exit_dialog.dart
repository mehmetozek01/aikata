import 'package:aikata_v2/constants/consts.dart';
import 'package:aikata_v2/widgets/our_button.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Onaylıyor musun?"
            .text
            .fontFamily(bold)
            .size(18)
            .color(darkFontGrey)
            .make(),
        const Divider(),
        10.heightBox,
        "Çıkmak istediğine emin misin?"
            .text
            .size(16)
            .color(darkFontGrey)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
              color: redColor,
              onPress: () {
                SystemNavigator.pop();
              },
              textColor: whiteColor,
              title: "Evet",
            ),
            ourButton(
              color: redColor,
              onPress: () {
                Navigator.pop(context);
              },
              textColor: whiteColor,
              title: "Hayır",
            ),
          ],
        ),
      ],
    ).box.color(lightGrey).padding(const EdgeInsets.all(12)).rounded.make(),
  );
}
