import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/theme_changer.dart';

enum Gender { male, female }

Gender? _gender;

class DarkScreen extends StatefulWidget {
  const DarkScreen({super.key});

  @override
  State<DarkScreen> createState() => _DarkScreenState();
}

class _DarkScreenState extends State<DarkScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Changing themes"),
      ),
      body: Consumer<ThemeChanger>(
        builder: (context, themeChanger, _) {
          return buildUI(themeChanger);
        },
      ),
    );
  }

  Widget buildUI(var themeChanger) {
    // final themeChanger = Provider.of<ThemeChanger>(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RadioListTile<ThemeMode>(
            title: Text("Light Theme"),
            value: ThemeMode.light,
            groupValue: themeChanger.themeMode,
            onChanged: (value) {
              themeChanger.changeTheme(value);
            }),
        RadioListTile<ThemeMode>(
            title: Text("Dark Theme"),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: (value) {
              themeChanger.changeTheme(value);
            }),
        RadioListTile<ThemeMode>(
            title: Text("System Theme"),
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged: (value) {
              themeChanger.changeTheme(value);
            }),
        Icon(Icons.heart_broken),
        RadioListTile<Gender>(
          title: Text("Male"),
            value: Gender.male, groupValue: _gender, onChanged: (value){
              setState(() {
                _gender = value;
                print(_gender);

              });
        }),
        RadioListTile<Gender>(
          title: Text("Female"),
            activeColor: Colors.teal,
            toggleable: true,
            tileColor: Colors.amber,
            secondary: const Icon(Icons.female),
            controlAffinity: ListTileControlAffinity.leading,
            value: Gender.female, groupValue: _gender, onChanged: (value){
          setState(() {
            _gender = value;
            print(_gender);
          });
        })
      ],
    );
  }
}
