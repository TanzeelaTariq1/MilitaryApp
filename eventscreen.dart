import 'package:flutter/material.dart';
import 'PhotosByEventTypeScreen.dart'; // Import the detailed view screen

class EventScreen extends StatelessWidget {
  final List<String> events = [
    'Important Event',
    'Recent Event',
    'National Event',
    'Annual Gathering'
  ]; // Example events

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Event Type'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(events[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PhotosByEventTypeScreen(eventType: events[index])),
              );
            },
          );
        },
      ),
    );
  }
}
