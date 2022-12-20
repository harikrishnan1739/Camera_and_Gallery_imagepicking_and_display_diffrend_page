import 'dart:io';

import 'package:camera_access/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  File? image;//-----------File-image------//
  //------------------camera--access--------function----start------
  Future pickercamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      } else {
        final imageTemporary = File(image.path);
        setState(
          () => this.image = imageTemporary,
        );
      }
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }
    //------------------camera--access--------function----end------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 120, 214, 181),
        elevation: 0,
        title: const Center(child: Text('Ｃａｍｅｒａ',style: TextStyle(color: Colors.black),)),
      ),
      backgroundColor: const Color.fromARGB(255, 134, 247, 208),
     
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           //------------------------get-- the--image-and-display---------start----
          image == null
              ? AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    color: const Color.fromARGB(255, 167, 255, 196),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.open_in_browser),
                        Text('Ｎｏ ｉｍａｇｅ ｓｅｌｅｃｔ')
                      ],
                    ),
                  ),
                )
              : AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.file(
                    File(image!.path),
                    fit: BoxFit.cover,
                  ),
                ),
                 //------------------------get-- the--image-and-display---------end----
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    pickercamera();
                  },
                  icon: const Icon(
                    Icons.camera,
                    size: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 270.0, bottom: 20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => const Gallery()));
                    },
                    icon: const Icon(
                      Icons.photo_size_select_actual_outlined,
                      size: 50,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
