import 'package:flutter/material.dart';

class OtherApps extends StatelessWidget {
  const OtherApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Apps'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildAppCard('Marilearn', 'Place to learn', Colors.red, Icons.abc),
          _buildAppCard(
              'Marimusic', 'Browse music here', Colors.green, Icons.music_note),
          _buildAppCard('Maricamera', 'Browse camera catalog', Colors.blue,
              Icons.camera_alt),
          _buildAppCard(
              'Marishop', 'Place to shop', Colors.yellow, Icons.shopping_cart),
        ],
      ),
    );
  }

  Widget _buildAppCard(
      String appName, String description, Color color, IconData icon) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to the app details page
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 64.0,
              color: color,
            ),
            SizedBox(height: 16.0),
            Text(
              appName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
