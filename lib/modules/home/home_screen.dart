import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/data/database.dart';
import 'package:notepad/modules/widget/dialog_box.dart';
import 'package:notepad/modules/widget/fall_back.dart';
import 'package:notepad/modules/widget/todo_tile_screen.dart';
import 'package:notepad/shared/components/components.dart';

class HomeScreen extends StatefulWidget
{

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  final _myBox = Hive.box('myBox');

  TextEditingController controller = TextEditingController();

  NotepadDataBase db = NotepadDataBase();

  @override
  initState()
  {
    if(_myBox.get('NOTEPAD') != null)
    {
      db.loadData();
    }
    super.initState();
  }

  checkBoxChanged(bool? value, int index)
  {
    setState(()
    {
      db.notepadList[index][1] = ! db.notepadList[index][1];
    });
    db.updateDataBase();
  }

  saveNewTask()
  {
    setState(()
    {
      db.notepadList.add([controller.text,false]);
      controller.clear();
    });
    navigatePop(context);
    db.updateDataBase();
  }

  createNewTask()
  {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: controller,
        onSave: saveNewTask,
        onCancel: () => navigatePop(context),
      ),
    );
  }

  deleteTask(int index)
  {
    setState(()
    {
      db.notepadList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notepad',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ConditionalBuilder(
            condition: db.notepadList.isNotEmpty ,
            builder: (BuildContext context) => ListView.builder(
              itemCount: db.notepadList.length,
              itemBuilder: (context,index)
              {
                return TodoTileScreen(
                  taskName: db.notepadList[index][0],
                  taskCompleted: db.notepadList[index][1],
                  onChanged: (value) => checkBoxChanged(value,index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
            fallback: (BuildContext context) => const FallBack(),
          ),
        ),
      );
  }

}
