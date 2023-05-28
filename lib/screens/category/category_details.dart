import 'package:aikata_v2/constants/consts.dart';
import 'package:aikata_v2/screens/category/item_details.dart';
import 'package:aikata_v2/widgets/bg_widget.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      6,
                      (index) => "Baby Clothing"
                          .text
                          .size(12)
                          .fontFamily(bold)
                          .color(darkFontGrey)
                          .makeCentered()
                          .box
                          .white
                          .rounded
                          .size(120, 50)
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .make(),
                    ),
                  ),
                ),
                //items container
                20.heightBox,
                Expanded(
                  child: GridView.builder(
                    itemCount: 6,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            tMicrophoneImg,
                            width: 200,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          "Mikrofon"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          10.heightBox,
                          "600 ₺"
                              .text
                              .color(redColor)
                              .fontFamily(bold)
                              .size(16)
                              .make(),
                          10.heightBox
                        ],
                      )
                          .box
                          .white
                          .margin(const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4))
                          .rounded
                          .outerShadowSm
                          .padding(const EdgeInsets.all(8))
                          .make()
                          .onTap(() {
                        Get.to(() => const ItemDetails(
                              title: "Dummy Item",
                            ));
                      });
                    },
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
