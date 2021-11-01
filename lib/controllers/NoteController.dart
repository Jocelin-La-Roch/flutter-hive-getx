import 'package:get/get.dart';

class NoteController extends GetxController{

  List _notes = [];

  List get notes => _notes;

  setNotes(List data){
    _notes = data;
    update();
  }

}