class Task {
  String task;
  bool done;

  Task({this.task, this.done = false});

  isDone() {
    done = !done;
  }
}
