import 'package:flutter/material.dart';

class YearImages {
  final String year;
  final List<Map<String, String>> images;

  YearImages({required this.year, required this.images});
}

class PhotosByYearScreen extends StatelessWidget {
  final String year;
  PhotosByYearScreen({required this.year});

  final List<YearImages> allYearImages = [
    YearImages(
      year: '2020',
      images: List.generate(
          10,
          (index) => {
                "url": 'https://picsum.photos/200/150?random=2020${index}',
                "caption": "2020 Image ${index + 1}"
              }),
    ),
    YearImages(
      year: '2021',
      images: List.generate(
          10,
          (index) => {
                "url": 'https://picsum.photos/200/150?random=2021${index}',
                "caption": "2021 Image ${index + 1}"
              }),
    ),
    YearImages(
      year: '2022',
      images: List.generate(
          10,
          (index) => {
                "url": 'https://picsum.photos/200/150?random=2022${index}',
                "caption": "2022 Image ${index + 1}"
              }),
    ),
    YearImages(
      year: '2023',
      images: List.generate(
          10,
          (index) => {
                "url": 'https://picsum.photos/200/150?random=2023${index}',
                "caption": "2023 Image ${index + 1}"
              }),
    ),
    // Additional years can be added similarly
  ];

  List<Map<String, String>> getImagesForYear() {
    return allYearImages
        .firstWhere((y) => y.year == year,
            orElse: () => YearImages(year: year, images: []))
        .images;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> yearImages = getImagesForYear();

    return Scaffold(
      appBar: AppBar(
        title: Text('Photos from $year'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (1 / 0.8), // Adjusted for better vertical spacing
        ),
        itemCount: yearImages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(yearImages[index]['url']!,
                      fit: BoxFit.cover),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.black, // Dark background for the caption
                  child: Text(
                    yearImages[index]['caption']!,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
