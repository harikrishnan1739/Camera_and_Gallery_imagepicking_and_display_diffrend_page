import 'dart:io';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class Camerapics extends StatefulWidget {
  const Camerapics({super.key});

  @override
  State<Camerapics> createState() => _CamerapicsState();
}

class _CamerapicsState extends State<Camerapics> {
  File? _image;
  final _ImagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}