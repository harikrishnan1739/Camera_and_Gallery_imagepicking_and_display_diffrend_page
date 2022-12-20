import 'dart:io';//-------------must------------//
import 'package:camera_access/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports, unused_import, unnecessary_import
import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  File? image;
  final imagepicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    //------------------------gallery-image-access---function----start---
    Future pickergallery() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
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
    //------------------------gallery-image-access---function----end---

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 134, 247, 208),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left:64.0),
          child: Text('Ｇａｌｌｅｒｙ',style: TextStyle(color: Colors.black),),
        ),
        leading: IconButton(
          color: Colors.black,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const Homepage()));
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 120, 214, 181),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //------------------gallery-image-access--------display----start------
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
                //------------------gallery-image-access--------display----end------
                const SizedBox(height: 20,),
          Column(
            children: [
              MaterialButton(
                minWidth: 300,
                height: 45,
                onPressed: () {
                  pickergallery();
                },
                color: const Color.fromARGB(255, 22, 21, 23),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: const Text(
                  "Ｂｒｏｗｓｗ ｔｏ Ｇａｌｌｅｒｙ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
