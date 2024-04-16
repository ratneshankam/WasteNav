import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ScrollImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 2000), // Set animation duration
        enlargeCenterPage: true,
      ),
      items: [
        for (int i = 1; i <= 4; i++)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10,),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Image.asset("assets/images/scrollimg/scrollimg${i}.jpg",
                width: 350,
                height: 150,
              ),
            ),
          ),
      ],
    );
  }
}
