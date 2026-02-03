

import '../../services/backend_factory.dart';
import '../../services/task_queue.dart';

class RepoData {
  String parentCollection = "";
  String collectionName = "";
  String error = "";

  bool loading = false;

  // Must be initialized by containing class
  late Database db;
  late Storage store;
  late Logger logger;
  late LukhuTaskQueue q;
}
