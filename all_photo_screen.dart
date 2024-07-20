import 'package:flutter/material.dart';

class Photo {
  final String url;
  final String caption;
  final String year;
  final String event;

  Photo(
      {required this.url,
      required this.caption,
      required this.year,
      required this.event});
}

class AllPhotosScreen extends StatefulWidget {
  @override
  _AllPhotosScreenState createState() => _AllPhotosScreenState();
}

class _AllPhotosScreenState extends State<AllPhotosScreen> {
  List<Photo> allPhotos = List.generate(
      15,
      (index) => Photo(
            url:
                'https://picsum.photos/200/150?random=$index', // Dynamic URL generation for each image
            caption: 'Image ${index + 1}',
            year: '202${index % 3}', // Random year generation for demonstration
            event: (index % 2 == 0)
                ? 'Event A'
                : 'Event B', // Alternate between two event types
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Photos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7, // 7 images per row as required
          crossAxisSpacing: 10, // Spacing between each image horizontally
          mainAxisSpacing: 10, // Spacing between each image vertically
          childAspectRatio: 1, // Aspect ratio to make images square
        ),
        itemCount: allPhotos.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(allPhotos[index].url, fit: BoxFit.cover),
            footer: Container(
              color: Colors.black54,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              alignment: Alignment.center,
              child: Text(
                allPhotos[index].caption,
                style: TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
