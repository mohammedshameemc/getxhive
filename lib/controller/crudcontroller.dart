import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';

import '../model.dart';

class NoteController extends GetxController {
  final notes = <listmodels>[].obs;

  Future<void> addNote(String name, String addres) async {
    final box = Hive.box('notes');
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    await box.put(id, {'id': id, 'name': name, 'addres': addres});
    getNotes();
  }

  void onInit() {
    getNotes();
    super.onInit();
  }

  void getNotes() {
    final box = Hive.box('notes');
     notes.assignAll(box.values
        .map((note) => listmodels(
              id: note['id'].toString(),
              name: note['name'].toString(),
              addres: note['addres'].toString(),
            ))
        .toList());
    // note = notes.reversed.toList();
  }

  void UpdateNote(String id, String name, String addres) async {
    final box = Hive.box('notes');
    await box.put(id, {'id': id, 'name': name, 'addres': addres});
    getNotes();
  }

  void DeleteNote(String id) async {
    final box = Hive.box('notes');
    await box.delete(id);
    getNotes();
  }
}
