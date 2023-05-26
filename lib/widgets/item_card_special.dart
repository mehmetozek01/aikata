import 'package:aikata_v2/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../model/special_model.dart';

class CardSpecial extends StatefulWidget {
  const CardSpecial({
    Key? key,
  }) : super(key: key);

  @override
  State<CardSpecial> createState() => _CardSpecialState();
}

class _CardSpecialState extends State<CardSpecial> {
  int _currentPage = 0;

  late CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 150,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
            viewportFraction: 1.0, // Set viewportFraction to 1.0
          ),
          itemCount: specialModel.length,
          itemBuilder: (context, index, _) {
            return Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffE7E7E7),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            specialModel[index].percentage,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            specialModel[index].title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            specialModel[index].subtitle,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Image(
                      image: AssetImage(specialModel[index].image),
                      width: 140,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < specialModel.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 5,
                  width: _currentPage == i ? 20 : 5,
                  decoration: BoxDecoration(
                    color: _currentPage == i ? primaryColor : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
