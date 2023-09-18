import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome to our Photo Gallery!",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your text...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    final snackBar = SnackBar(
                      content: Text("Image ${index + 1} clicked"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "Asset/cat.jpg",fit: BoxFit.fill,    ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Image ${index + 1}"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset("Asset/cat.jpg"),
              title: Text("Sample Photo 1"),
              subtitle: Text("Subtitle 1"),
            ),
            ListTile(
              leading: Image.asset("Asset/cat.jpg"),
              title: Text("Sample Photo 2"),
              subtitle: Text("Subtitle 2"),
            ),
            ListTile(
              leading: Image.asset("Asset/cat.jpg"),
              title: Text("Sample Photo 3"),
              subtitle: Text("Subtitle 3"),
            ),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text("Photos Uploaded Successfully!"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text("Upload Photos"),
            ),
          ],
        ),
      ),
    );
  }
}
