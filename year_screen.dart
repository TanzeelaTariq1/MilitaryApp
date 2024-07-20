import 'package:flutter/material.dart';
import 'PhotosByYearScreen.dart'; // Import the detailed view screen

class YearScreen extends StatelessWidget {
  final List<String> years = ['2020', '2021', '2022', '2023']; // Example years

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Year'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: years.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(years[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PhotosByYearScreen(year: years[index])),
              );
            },
          );
        },
      ),
    );
  }
}
