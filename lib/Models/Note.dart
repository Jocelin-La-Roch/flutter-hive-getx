import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notes/controllers/NoteController.dart';
import 'package:notes/hive/NoteBox.dart';
import 'package:notes/sceens/ViewNoteScreen.dart';

part 'Note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject{

  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  Note({required this.id, required this.title, required this.description});

  add(){
    final NoteController noteController = Get.find();
    List notes = noteController.notes;
    notes.add(this);
    NoteBox().putNotes(notes);
    Get.off(() => ViewNoteScreen(note: this));
    Get.snackbar("Add", "Success", snackPosition: SnackPosition.BOTTOM);
  }

  delete() async {
    final NoteController noteController = Get.put(NoteController());
    List notes = noteController.notes;
    notes.remove(this);
    NoteBox().putNotes(notes);
    Get.snackbar("Delete", "Success", snackPosition: SnackPosition.BOTTOM);
  }

  edit(String title, String description){
    this.title = title;
    this.description = description;
    final NoteController noteController = Get.put(NoteController());
    List notes = noteController.notes;
    notes[this.id] = this;
    NoteBox().putNotes(notes);
    Get.off(() => ViewNoteScreen(note: this));
    Get.snackbar("Edit", "Success", snackPosition: SnackPosition.BOTTOM);
  }

}