import 'package:aikata_v2/constants/consts.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, width: 26),
        ],
      ).box.rounded.white.size(width, height).shadowSm.make(),
      5.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  );
}
