import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload_test/alert_dialog.dart';
import 'package:image_upload_test/drawer.dart';
import 'package:image_upload_test/pick_image.dart';
import 'package:image_upload_test/slivers_basic.dart';
import 'package:image_upload_test/tab_bar.dart';
import 'package:image_upload_test/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: SliversBasicPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Stack(children: [
            _image != null
                ? CircleAvatar(
                    radius: 65,
                    backgroundImage: MemoryImage(_image!),
                  )
                : CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600"),
                  ),
            Positioned(
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: selectImage,
                ),
                bottom: -10,
                left: 80)
          ])
        ],
      )),
    );
  }
}
