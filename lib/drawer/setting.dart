import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class ColorSettings {
  static const String colorKey = 'backgroundColor';

  static Future<Color> getBackgroundColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt(colorKey);
    return colorValue != null ? Color(colorValue) : Colors.white;
  }

  static Future<void> setBackgroundColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(colorKey, color.value);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Color>(
      future: ColorSettings.getBackgroundColor(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
              backgroundColor: snapshot.data,
              appBar: AppBar(
                title: Text('Color Settings'),
              ),
              body: Center(
                child: Text('Change the background color in settings'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                child: Icon(Icons.settings),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color selectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: selectedColor,
              radius: 50,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select Color'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: selectedColor,
                          onColorChanged: (color) {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          showLabel: true,
                          pickerAreaHeightPercent: 0.8,
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Save'),
                          onPressed: () async {
                            await ColorSettings.setBackgroundColor(selectedColor);
                            Navigator.of(context).pop();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Change Color'),
            ),
          ],
        ),
      ),
    );
  }
}
