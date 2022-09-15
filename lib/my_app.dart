import 'package:flutter/material.dart';

import 'services/service_theme.dart';
import 'ui/pages/my_home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.å
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeService,
        builder: (context, value, _) {
          return MaterialApp(
            title: 'Theme Demo',
            theme: themeService.theme,
            home: MyHomePage(
              function: (int number) =>
                  themeService.switchLightAndDarkTheme(number),
            ),
          );
        });
  }
}
