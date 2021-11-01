import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notes/controllers/NoteController.dart';

class NoteBox{

  getNotes(){
    return Hive.box("noteBox").get("notes", defaultValue: []);
  }

  putNotes(List data) async {
    final NoteController noteController = Get.find();
    await Hive.box("noteBox").put("notes", data);
    List notes = getNotes();
    noteController.setNotes(notes);
  }

}