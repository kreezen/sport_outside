import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sportoutside/domain/entities/sportplace.dart';

class SportPlacePreviewWidget extends StatelessWidget {
  final SportPlace sportPlace;
  const SportPlacePreviewWidget({Key? key, required this.sportPlace})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: [
          CarouselSlider(
            items: sportPlace.images
                .map((e) => Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(
                        e,
                        fit: BoxFit.fill,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(),
          ),
          const Divider(
            thickness: 2,
          ),
          Text(
            sportPlace.description,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
