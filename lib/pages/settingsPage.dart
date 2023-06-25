import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  int _dropdownIndex = 0;
  double _spiciness = 0.5;
  DateTime _dob = DateTime.now();
  late String _imagePath;

  bool _option1 = false;
  bool _option2 = false;

  void _onDarkModeChanged(bool value) {
    setState(() {
      _darkMode = value;
    });
  }

  void _onDropdownChanged(int? value) {
    if (value != null) {
      setState(() {
        _dropdownIndex = value;
      });
    }
  }

  void _onSpicinessChanged(double value) {
    setState(() {
      _spiciness = value;
    });
  }

  Future<void> _onDobChanged(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dob = pickedDate;
      });
    }
  }

  List<String> _selectedTasteAttributes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Settings',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'App Notifications',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(color: Colors.grey),
                SwitchListTile(
                  title: const Text('Show Notifications'),
                  value: _darkMode,
                  onChanged: _onDarkModeChanged,
                ),
                const Divider(color: Colors.grey),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Preferences',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('What is your preference?'),
                    const SizedBox(width: 85.0),
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        value: _dropdownIndex,
                        items: [
                          const DropdownMenuItem<int>(
                            value: 0,
                            child: Text('Cheapest'),
                          ),
                          const DropdownMenuItem<int>(
                            value: 1,
                            child: Text('Best Rating'),
                          ),
                          const DropdownMenuItem<int>(
                            value: 2,
                            child: Text('Nearest'),
                          ),
                        ],
                        onChanged: _onDropdownChanged,
                      ),
                    ),
                  ],
                ),
                CheckboxListTile(
                  title: const Text('Get notification for deals'),
                  value: _option1,
                  onChanged: (value) {
                    setState(() {
                      _option1 = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Get notification for coming orders'),
                  value: _option2,
                  onChanged: (value) {
                    setState(() {
                      _option2 = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                const Divider(color: Colors.grey),
                const Text(
                  'Notification Intensity',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    thumbColor: Colors.pink,
                    activeTrackColor: Colors.pink,
                    inactiveTrackColor: Colors.grey,
                  ),
                  child: Slider(
                    value: _spiciness,
                    min: 0.0,
                    max: 5.0,
                    divisions: 5,
                    onChanged: _onSpicinessChanged,
                    label: 'Spiciness: $_spiciness',
                  ),
                ),
                const Divider(color: Colors.grey),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(color: Colors.grey),
                InkWell(
                  onTap: () => _onDobChanged(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Date of Birth',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${_dob.day}/${_dob.month}/${_dob.year}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
