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
}