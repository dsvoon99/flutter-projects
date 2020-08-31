class Task {
  String d;
  bool done = false;

  Task({this.d});

  updateDone(bool newValue) {
    done = newValue;
  }
}