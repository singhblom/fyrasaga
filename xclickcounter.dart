import 'package:web_ui/web_ui.dart';

class CounterComponent extends WebComponent {
  var type = {};
  var name = "None";
  var deletable = false;

  void increment() {
    type[name]++;
  }
  void decrement() {
    type[name]--;
  }
  void remove() {
    type.remove(name);
  }
}
