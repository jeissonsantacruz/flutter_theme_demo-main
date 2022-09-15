import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_demo/services/service_theme.dart';
import 'package:theme_demo/ui/pages/bloc/my_home_page_bloc.dart';

class MyHomePage extends StatefulWidget {
  final Function(int) function;

  const MyHomePage({super.key, required this.function});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeData darkTheme = customThemeFromColorScheme(darkColorScheme,
      GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme), true);

  @override
  dispose() {
    super.dispose();
    homePageBloc.dividerController.close();
    homePageBloc.wheelNotifier.close();
  }

  @override
  void initState() {
    super.initState();
    homePageBloc.dividerController.stream.listen((event) {
      widget.function(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinningWheel(
              Image.asset('assets/images/roulette.png'),
              width: 512,
              height: 512,
              canInteractWhileSpinning: false,
              dividers: 10,
              onUpdate: homePageBloc.dividerController.add,
              onEnd: homePageBloc.dividerController.add,
              secondaryImage:
                  Image.asset('assets/images/roulette-center-300.png'),
              secondaryImageHeight: 100,
              secondaryImageWidth: 100,
              secondaryImageLeft: 150,
              secondaryImageTop: 150,
              shouldStartOrStop: homePageBloc.wheelNotifier.stream,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text("Start"),
              onPressed: () {
                homePageBloc.onPressedButton();
              },
            )
          ],
        ),
      ),
    );
  }
}
