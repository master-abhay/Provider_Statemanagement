import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/example_one_Slider.dart';
import 'package:provider_state_management/Providers/favourite_app_provider.dart';
import 'package:provider_state_management/Providers/restApi_AuthProvider.dart';
import 'package:provider_state_management/Providers/theme_changer.dart';

import 'Screens/ValueNotifier_example.dart';
import 'Screens/dark_theme_example.dart';
import 'Screens/getRequest_screen.dart';
import 'Screens/restApi_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // For single Provider
    // return ChangeNotifierProvider(
    //     create: (_) => CountProvider(),
    //     child: MaterialApp(
    //       title: 'Flutter Demo',
    //       theme: ThemeData(
    //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //         useMaterial3: true,
    //       ),
    //       home: CountExample(),
    //
    //     ));

    //For Multiple Provider
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ExampleOneSlider()),
          ChangeNotifierProvider(create: (_) => FavouriteAppProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_)=>RestApiAuthProvider())
        ],
        child: Builder(
            builder: (BuildContext context) => Consumer<ThemeChanger>(
                builder: (context, value, Widget? child) => MaterialApp(
                    title: 'Flutter Demo',
                    themeMode: value.themeMode,
                    darkTheme: ThemeData(
                      brightness: Brightness.dark,
                      primaryColor: Colors.pink,
                      primarySwatch: Colors.yellow,
                      appBarTheme: AppBarTheme(
                        backgroundColor: Colors.teal
                      ),
                      iconTheme: IconThemeData(color: Colors.yellow)

                    ),

                    theme: ThemeData(
                      brightness: Brightness.light,
                      primarySwatch: Colors.red,
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                      useMaterial3: true,
                    ),

                    home: GetRequest()))));
  }

}
