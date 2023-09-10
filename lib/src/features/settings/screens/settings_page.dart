import 'dart:js';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/features/settings/screens/abouthelp.dart';
import 'package:moodup/src/features/settings/screens/account_settings.dart';
import 'package:moodup/src/features/settings/screens/language.dart';
import 'package:moodup/src/features/settings/screens/moodtracking.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kDarkGreen,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Settings'),
            ],
          ),
        ),
      ),
      body: _buildSettingsList(context),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            subtitle: Text('Edit Profile, Change Password'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AccountPage()), // Navigate to AccountPage
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.lightbulb_circle_sharp), // Leading Icon
            title: Text('Dark Mode'),
            subtitle: Text('Switch between light and dark modes'),
            trailing: Switch(
              value: _getOption2Value(),
              onChanged: (bool newValue) {
                _setOption2Value(newValue);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.timer),
            title: Text('Mood Tracking'),
            subtitle: Text('Mood reminder, Mood log time'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MoodTrackingPage()), // Navigate to AccountPage
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('Choose your preferred app language.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LanguagePage()), // Navigate to AccountPage
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.help),
            title: Text('About and Help'),
            subtitle: Text('App Version, Help Center'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AboutHelpPage()), // Navigate to AccountPage
              );
            },
          ),
        ),
      ],
    );
  }

  bool _getOption2Value() {
    return false;
  }

  void _setOption2Value(bool newValue) {}
}
