import 'dart:async';
import 'dart:math';

/// Class that constains the BLOC of "My_Home_page"
class _MyHomePageBloc {
  /// Controller for the divider roulette
  final StreamController<int> dividerController = StreamController<int>();

  /// Controller for the wheel roulette
  final StreamController wheelController = StreamController<double>();

  /// Function to generate a random velocity
  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  /// Function to generate a initial roulette
  void onPressedButton() {
    wheelController.sink.add(_generateRandomVelocity());
  }
}

/// Singleton of BLOC
final homePageBloc = _MyHomePageBloc();
