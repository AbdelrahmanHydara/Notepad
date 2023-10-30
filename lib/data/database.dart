import 'package:hive_flutter/hive_flutter.dart';

class NotepadDataBase
{
  List notepadList = [];

  final _myBox = Hive.box('myBox');

  createInitialData()
  {
    notepadList = [];
  }

  loadData()
  {
    notepadList = _myBox.get('NOTEPAD');
  }

  updateDataBase()
  {
    _myBox.put('NOTEPAD', notepadList);
  }

}