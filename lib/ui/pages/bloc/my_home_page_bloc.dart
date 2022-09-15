import 'dart:async';
import 'dart:math';

class _MyHomePageBloc with BaseViewModel<MyHomePageDelegate> {
  final StreamController<int> dividerController = StreamController<int>();

  final StreamController wheelNotifier = StreamController<double>();

  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  double generateRandomAngle() => Random().nextDouble() * pi * 2;
  void onPressedButton() {
    wheelNotifier.sink.add(_generateRandomVelocity());
  }
}

final homePageBloc = _MyHomePageBloc();

abstract class MyHomePageDelegate {
  changeTheme(int value);
}

mixin BaseViewModel<T> {
  T? delegate;
}
