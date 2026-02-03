enum LukhuTaskStatus { running, success, error, canceled, paused }

class LukhuTask {
  double progress = 0;
  LukhuTaskStatus status = LukhuTaskStatus.success;
  String error = "";
}

class LukhuTaskQueue {
  late Map<String, LukhuTask> queue;
  late Function notify;

  LukhuTaskQueue.instance() {
    queue = {};
    notify = () {};
  }
}
