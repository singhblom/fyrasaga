import 'package:web_ui/web_ui.dart';

class CounterComponent extends WebComponent {
  var type = {};
  var name = "None";

  void increment() {
    type[name]++;
  }
  void decrement() {
    type[name]--;
  }
}
