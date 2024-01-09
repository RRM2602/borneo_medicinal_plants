import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'image_display_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/front.jpg', // Replace with the path to your front.jpg image
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100), // Adjust vertical padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectPictures();
                  },
                  child: Text('Select Pictures'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: Text('Take Picture'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> selectPictures() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      navigateToImageDisplayPage(pickedFile.path);
    }
  }

  Future<void> takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      navigateToImageDisplayPage(pickedFile.path);
    }
  }

  void navigateToImageDisplayPage(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDisplayPage(imagePath: imagePath),
      ),
    );
  }
}
