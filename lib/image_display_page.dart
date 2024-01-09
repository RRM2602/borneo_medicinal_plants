import 'dart:io';
import 'package:flutter/material.dart';



class ImageDisplayPage extends StatelessWidget {
  final String imagePath;

  ImageDisplayPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Display'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust as needed
              height: MediaQuery.of(context).size.width * 0.8, // Adjust as needed
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
