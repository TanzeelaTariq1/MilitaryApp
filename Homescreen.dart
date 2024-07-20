import 'package:flutter/material.dart';
import 'year_screen.dart'; // Ensure this screen is created
import 'eventscreen.dart'; // Ensure this screen is created
import 'all_photo_screen.dart'; // Ensure this screen is created

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the Military System',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(56.0),
            child: Text(
              'Welcome to Our Military Archive',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Explore our extensive archive of military photos, organized meticulously by year and event type. Dive into historical and contemporary military events through a vast collection of visuals. Each photograph tells a story, capturing moments of military significance from various angles and perspectives. This archive serves as a vital resource for researchers, enthusiasts, and historians alike, providing detailed visual documentation of military history.',
                      style: TextStyle(fontSize: 16, color: Colors.brown),
                    ),
                  ),
                ),
                Expanded(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/6/64/Yaadgaar-E-Shauhda_Multan_Cantt.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavigationButton(context, 'View by Year', YearScreen()),
                _buildNavigationButton(context, 'View by Event', EventScreen()),
                _buildNavigationButton(
                    context, 'View All Photos', AllPhotosScreen()),
                _buildNavigationButton(context, 'Search Photos',
                    null), // Updated for search functionality
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(
      BuildContext context, String label, Widget? destinationScreen) {
    return ElevatedButton(
      onPressed: () {
        if (destinationScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          );
        } else {
          _showSearch(
              context); // Call the search dialog function if no screen is provided
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(label, style: TextStyle(fontSize: 14)),
    );
  }

  void _showSearch(BuildContext context) {
    TextEditingController _idController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Search by ID'),
          content: TextField(
            controller: _idController,
            decoration: InputDecoration(hintText: 'Enter ID'),
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (_idController.text == '1234') {
                  _showValidIDResult(context);
                } else {
                  _showInvalidIDAlert(context);
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
              ),
              child: Text('Search'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
              ),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showValidIDResult(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Valid ID: Images for ID 1234'),
          content: SizedBox(
            width: double.maxFinite, // Makes the dialog take up more space
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(
                3,
                (index) => Image.network(
                    'https://picsum.photos/200/200?random=${index + 1}',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
              ),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showInvalidIDAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Search Result'),
          content: Text('Invalid ID. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.brown,
                //primary: Colors.white,
              ),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
