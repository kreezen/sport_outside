import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportoutside/main.dart';

class CarouselWidget extends StatefulWidget {
  final List<XFile> imageFiles;

  CarouselWidget({required this.imageFiles});

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    if (widget.imageFiles.isEmpty) {
      return Container();
    }
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imageFiles.length,
          carouselController: _controller,
          options: CarouselOptions(
            height: 400,
            autoPlay: false,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemBuilder: (BuildContext context, int index, int realIdx) {
            final XFile imageFile = widget.imageFiles[index];
            return Stack(
              children: [
                Image.file(
                  File(imageFile.path),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cameraStore.of(context).deleteImg(index);
                    },
                  ),
                ),
              ],
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageFiles.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
