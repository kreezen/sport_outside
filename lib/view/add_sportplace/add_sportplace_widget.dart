import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:sportoutside/main.dart';
import 'package:sportoutside/view/add_sportplace/carousel_widget.dart';

class AddSportPlaceWidget extends StatelessWidget {
  const AddSportPlaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageFiles = cameraStore.of(context).imageFiles..watch(context);
    var imageErr = cameraStore.of(context).imageError..watch(context);

    imageErr.listen(context, () {
      if (imageErr.value != null) {
        final messenger = ScaffoldMessenger.of(context);
        messenger.hideCurrentSnackBar();
        messenger.showSnackBar(
          SnackBar(content: Text(imageErr.value.toString())),
        );
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Sport Place"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                imageFiles.value.maybeMap<Widget>(
                    orElse: () => FillerImg(),
                    data: (value) => CarouselWidget(imageFiles: value)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(children: [
                    Text(
                      "Select form gallery or camera",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.orangeAccent,
                          background: Paint()..color = Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.file_copy_outlined,
                              color: Colors.orangeAccent),
                          iconSize: 50,
                          onPressed: () {
                            cameraStore.of(context).galleryImage();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt_outlined,
                              color: Colors.orangeAccent),
                          iconSize: 50,
                          onPressed: () {
                            cameraStore.of(context).cameraImage();
                          },
                        ),
                      ],
                    )
                  ]),
                )
              ],
            )
          ],
        )));
  }
}

class FillerImg extends StatelessWidget {
  const FillerImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Image.network(
        "https://picsum.photos/200/300",
        fit: BoxFit.fill,
      ),
    );
  }
}
