import 'package:aikata_v2/constants/consts.dart';
import 'package:aikata_v2/constants/lists.dart';
import 'package:aikata_v2/widgets/our_button.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class ItemDetails extends StatefulWidget {
  final String? title;
  const ItemDetails({super.key, this.title});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool showFullDescription = false;
  @override
  Widget build(BuildContext context) {
    String description =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

    // String truncatedDescription =
    //     showFullDescription ? description : description.substring(0, 100);
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: widget.title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(IconlyLight.send)),
          IconButton(onPressed: () {}, icon: const Icon(IconlyLight.heart)),
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(IconlyLight.arrowLeft),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //swipper section
                      VxSwiper.builder(
                        // autoPlay: true,
                        height: 350,
                        aspectRatio: 16 / 9,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            tBlackNikeShoesImg,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      //title and details section
                      20.heightBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.title!.text
                                  .size(20)
                                  .color(darkFontGrey)
                                  .fontFamily(regular)
                                  .make(),
                              const Spacer(),
                              //rating
                              VxRating(
                                onRatingUpdate: (value) {},
                                normalColor: textfieldGrey,
                                selectionColor: golden,
                                count: 5,
                                size: 20,
                                stepInt: true,
                              ),
                              5.widthBox,
                              "4.0".text.fontFamily(semibold).make()
                            ],
                          ),
                          const Divider(
                            color: Colors.black12,
                            height: 40,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            child: Row(
                              children: [
                                "Satıcı: ".text.fontFamily(semibold).make(),
                                "In house Brands"
                                    .text
                                    .fontFamily(semibold)
                                    .color(redColor)
                                    .size(16)
                                    .make(),
                                const Spacer(),
                                const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    IconlyLight.message,
                                    color: darkFontGrey,
                                  ),
                                )
                              ],
                            ),
                          ),
                          10.heightBox
                        ],
                      )
                          .box
                          .roundedSM
                          .white
                          .padding(const EdgeInsets.all(8))
                          .make(),
                      10.heightBox,
                      Column(
                        children: [
                          10.heightBox,
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Renk: ".text.color(darkFontGrey).make(),
                              ),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => VxBox()
                                      .size(40, 40)
                                      .roundedFull
                                      .color(Vx.randomPrimaryColor)
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 6))
                                      .make(),
                                ),
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          //quantity section
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Adet: ".text.color(darkFontGrey).make(),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove)),
                                  "0"
                                      .text
                                      .size(16)
                                      .color(darkFontGrey)
                                      .fontFamily(bold)
                                      .make(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
                                  10.widthBox,
                                  "(0 adet alınabilir)"
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ],
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          //total row
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child:
                                    "Toplan: ".text.color(darkFontGrey).make(),
                              ),
                              Row(
                                children: [
                                  "0.00 ₺"
                                      .text
                                      .color(redColor)
                                      .size(16)
                                      .fontFamily(bold)
                                      .make(),
                                ],
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          10.heightBox,
                        ],
                      )
                          .box
                          .roundedSM
                          .white
                          .padding(const EdgeInsets.all(8))
                          .make(),
                      10.heightBox,
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedCrossFade(
                                firstChild: buildShortDescription(description),
                                secondChild: buildFullDescription(description),
                                crossFadeState: showFullDescription
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 300),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showFullDescription = !showFullDescription;
                                  });
                                },
                                child: Text(
                                  showFullDescription
                                      ? "Daha Az"
                                      : "Daha Fazla",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: turuncu,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                              10.heightBox,
                            ],
                          ),
                        ],
                      )
                          .box
                          .roundedSM
                          .white
                          .padding(const EdgeInsets.all(8))
                          .make(),
                      10.heightBox,
                      Column(
                        children: [
                          productsyoumaylike.text
                              .fontFamily(bold)
                              .size(16)
                              .color(darkFontGrey)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                6,
                                (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      tMicrophoneImg,
                                      width: 150,
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
                                        horizontal: 4))
                                    .rounded
                                    .padding(const EdgeInsets.all(8))
                                    .make(),
                              ),
                            ),
                          )
                        ],
                      )
                          .box
                          .roundedSM
                          .white
                          .padding(const EdgeInsets.all(8))
                          .make(),
                      10.heightBox,
                      Column(
                        children: [
                          ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: List.generate(
                              itemDetailButtonList.length,
                              (index) => ListTile(
                                title: itemDetailButtonList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: const Icon(IconlyLight.arrowRight2),
                              ),
                            ),
                          ),
                        ],
                      )
                          .box
                          .roundedSM
                          .white
                          .padding(const EdgeInsets.all(8))
                          .make(),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    children: [
                      "Fiyatlara KDV dahildir".text.size(12).make(),
                      10.heightBox,
                      "30.00 ₺"
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(18)
                          .make(),
                    ],
                  ),
                ),
                30.widthBox,
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: context.screenWidth - 200,
                    height: 60,
                    child: ourButton(
                        color: turuncu,
                        onPress: () {},
                        textColor: whiteColor,
                        title: "Sepete ekle"),
                  ),
                ),
              ],
            ),
            10.heightBox
          ],
        ),
      ),
    );
  }

  Widget buildShortDescription(String description) {
    return Text(
      "${description.substring(0, 100)}...",
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }

  Widget buildFullDescription(String description) {
    return Text(
      description,
      softWrap: true,
    );
  }
}
