import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  ImagePicker _picker = ImagePicker();
  XFile? image;
  List<XFile>? images=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    image = await _picker.pickImage(source: ImageSource.camera);
                    setState(() {});
                  },
                  child: Text("Camera")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () async {
                image = await _picker.pickImage(source: ImageSource.gallery);
                setState(() {});
              }, child: Text("Gallery")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  ElevatedButton(onPressed: () async {
                    images = await _picker.pickMultiImage();
                    print(images);
                    setState(() {
                      
                    });

                  }, child: Text("MultiImage")),
            ),
            image!=null?Image.file(File(image!.path)):Text("No Image"),
            Expanded(child: images.length!=0?ListView())
          ],
        ),
      ),
    );
  }
}
