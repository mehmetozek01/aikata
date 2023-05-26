import 'package:aikata_v2/constants/consts.dart';
import 'package:aikata_v2/widgets/item_card_special.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  late String greeting;

  @override
  void initState() {
    super.initState();
    final DateTime currentTime = DateTime.now();
    final int currentHour = currentTime.hour;

    if (currentHour >= 6 && currentHour < 12) {
      greeting = 'Günaydın';
    } else if (currentHour >= 12 && currentHour < 19) {
      greeting = 'Merhaba';
    } else {
      greeting = 'İyi geceler';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Hoşgeldin
                    Row(
                      children: [
                        Image.asset(
                          logo,
                          width: 55,
                          height: 55,
                        ),
                        20.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$greeting 👋',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff757575),
                              ),
                            ),
                            5.heightBox,
                            const Text(
                              "Chorn Thoen",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(IconlyLight.notification),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 15),
                        IconButton(
                          icon: const Icon(IconlyLight.heart),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    10.heightBox,
                    //Search
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      color: Colors.transparent,
                      child: TextFormField(
                        // maxLines: isDesc ? 4 : 1,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Ürün, kategori veya marka ara",
                          prefixIcon: Icon(
                            IconlyLight.search,
                            size: 25,
                            color: Colors.grey.shade500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: turuncu
                                // color: Colors.grey.shade500,
                                ),
                          ),
                          // hintText: hint,
                          hintStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ), //Special offers
                    //Special Offer
                    Row(
                      children: [
                        const Text(
                          "Özel teklif",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Tümü",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Swipper
                    10.heightBox,
                    const CardSpecial(),
                    //PopularCategories
                    20.heightBox,
                    Row(
                      children: [
                        const Text(
                          featuredCategories,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Tümü",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: cardIcons(context,
                                img: tClothImg, name: "Clothes"),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child: cardIcons(context,
                                img: tShoesImg, name: "Shoes"),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child:
                                cardIcons(context, img: tBagsImg, name: "Bags"),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child: cardIcons(context,
                                img: tElectronicsImg, name: "Electronics"),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: cardIcons(context,
                                img: tWatchImg, name: "Watch"),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child: cardIcons(context,
                                img: tJewelleryImg, name: "Jewelry"),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child: cardIcons(context,
                                img: tKichenImg, name: "Kitchen"),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child:
                                cardIcons(context, img: tToysImg, name: "Toys"),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    //featuredproduct
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: turuncu,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white
                              .fontFamily(bold)
                              .size(18)
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
                          ),
                        ],
                      ),
                    ),
                    //mostpopular
                    Row(
                      children: [
                        const Text(
                          "Keşfet",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Tümü",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //all product section
                    20.heightBox,
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 300,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              tMicrophoneImg,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
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
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .rounded
                            .padding(const EdgeInsets.all(12))
                            .make();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column cardIcons(BuildContext context,
      {required String img, required String name}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            color: turuncu,
            shape: BoxShape.circle,
          ),
          child: Image(
            image: AssetImage(img),
            color: whiteColor,
            height: 30,
            width: 30,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
