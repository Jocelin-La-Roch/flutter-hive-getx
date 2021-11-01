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
  }

  delete() async {
    final NoteController noteController = Get.put(NoteController());
    List notes = noteController.notes;
    notes.remove(this);
    NoteBox().putNotes(notes);
  }

  edit(String title, String description){
    final NoteController noteController = Get.put(NoteController());
    List notes = noteController.notes;
    notes[this.id] = Note(id: this.id, title: title, description: description);
    NoteBox().putNotes(notes);
    Get.off(() => ViewNoteScreen(note: Note(
      id: this.id,
      title: title,
      description: description
    )));
  }

}