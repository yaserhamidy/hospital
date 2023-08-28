import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Language'),
            trailing: DropdownButton<String>(
              value: 'English', // Replace with your language value variable
              onChanged: (newValue) {
                setState(() {
                  // Update the language value
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'English',
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: 'Spanish',
                  child: Text('Spanish'),
                ),
                // Add more language options as needed
              ],
            ),
          ),
          ListTile(
            title: Text('Theme'),
            trailing: DropdownButton<String>(
              value: 'Light', // Replace with your theme value variable
              onChanged: (newValue) {
                setState(() {
                  // Update the theme value
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Light',
                  child: Text('Light'),
                ),
                DropdownMenuItem(
                  value: 'Dark',
                  child: Text('Dark'),
                ),
                // Add more theme options as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}