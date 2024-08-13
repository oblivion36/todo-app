import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addTask(Map<String, dynamic> taskInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Task Name")
        .doc(id)
        .set(taskInfoMap);
  }
}
