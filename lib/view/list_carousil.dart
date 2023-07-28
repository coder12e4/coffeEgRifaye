import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffie_delivary/core/colors.dart';
import 'package:flutter/material.dart';

String reason = '';
final CarouselController controller = CarouselController();

void onPageChange(int index, CarouselPageChangedReason changeReason) {
  reason = changeReason.toString();
}

class CarouselChangeReasonDemoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: carousalList());
  }
}

Column carousalList() {
  return Column(
    children: <Widget>[
      Expanded(
        child: CarouselSlider(
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Container(
                      height: 700,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 700,
                      color: Colors.black,
                    ),
                    Container(
                      height: 700,
                      color: Colors.blue,
                    ),
                  ],
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            scrollDirection: Axis.vertical,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: onPageChange,
            autoPlay: true,
          ),
          carouselController: controller,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ...Iterable<int>.generate(3).map(
            (int pageIndex) => Flexible(
              child: ElevatedButton(
                onPressed: () => controller.animateToPage(pageIndex),
                child: Text("$pageIndex"),
              ),
            ),
          ),
        ],
      ),
      Center(
        child: Column(
          children: [
            Text('page change reason: '),
            Text(reason),
          ],
        ),
      )
    ],
  );
}
