import 'package:flutter/material.dart';

class AddSportPlaceWidget extends StatelessWidget {
  const AddSportPlaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Sport Place"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Image.network(
                    "https://picsum.photos/200/300",
                    fit: BoxFit.fill,
                  ),
                ),
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
                            //TODO
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt_outlined,
                              color: Colors.orangeAccent),
                          iconSize: 50,
                          onPressed: () {
                            //TODO
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
