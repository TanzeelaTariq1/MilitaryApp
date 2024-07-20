import 'package:flutter/material.dart';

class EventTypeImages {
  final String eventType;
  final List<Map<String, String>> images;

  EventTypeImages({required this.eventType, required this.images});
}

class PhotosByEventTypeScreen extends StatelessWidget {
  final String eventType;
  PhotosByEventTypeScreen({required this.eventType});

  final List<EventTypeImages> allEventImages = [
    EventTypeImages(
      eventType: 'National Event',
      images: List.generate(
          10,
          (index) => {
                "url": 'https://picsum.photos/200/150?random=n${index}',
                "caption": "National Event Image ${index + 1}"
              }),
    ),
    EventTypeImages(
      eventType: 'Annual Gathering',
      images: List.generate(
          10,
          (index) => {
                "url": 'https://picsum.photos/200/150?random=a${index}',
                "caption": "Annual Gathering Image ${index + 1}"
              }),
    ),
    EventTypeImages(
      eventType: 'Important Event',
      images: List.generate(
          5,
          (index) => {
                "url": 'https://picsum.photos/200/150?random=i${index}',
                "caption": "Important Event Image ${index + 1}"
              }),
    ),
    // New Recent Event type added
    EventTypeImages(
      eventType: 'Recent Event',
      images: List.generate(
          10, // Assuming we want 40 images for recent events
          (index) => {
                "url": 'https://picsum.photos/200/150?random=r${index}',
                "caption": "Recent Event Image ${index + 1}"
              }),
    ),
  ];

  List<Map<String, String>> getImagesForEventType() {
    return allEventImages
        .firstWhere((e) => e.eventType == eventType,
            orElse: () => EventTypeImages(eventType: 'None', images: []))
        .images;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> eventImages = getImagesForEventType();

    return Scaffold(
      appBar: AppBar(
        title: Text('Photos for $eventType'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7, // Adjust according to the design preference
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: (1 / 0.75),
        ),
        itemCount: eventImages.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Image.network(eventImages[index]['url']!, fit: BoxFit.cover),
            footer: Container(
              color: Colors.black54,
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              alignment: Alignment.center,
              child: Text(
                eventImages[index]['caption']!,
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
