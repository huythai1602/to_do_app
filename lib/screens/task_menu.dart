import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/screens/open_task_screen.dart';
import 'package:todo_app/widgets/radio_custom.dart';

class TaskMenu extends StatefulWidget {
  const TaskMenu({super.key});

  @override
  State<TaskMenu> createState() => _TaskMenuState();
}

class _TaskMenuState extends State<TaskMenu> {
  late final TextEditingController newController;
  late final SharedPreferences prefs;
  String taskName = '';
  String taskTime = '';
  List taskInfo = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      setTask();
      setState(() {
        isLoading = false;
      });
    });
    newController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: AppBar(
              title: Container(
                margin: const EdgeInsets.only(left: 100),
                child: const Text(
                  'School',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4e5158),
                  ),
                ),
              ),
              toolbarHeight: 100,
              leading: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF919399),
                    ),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF4e5158),
                  ),
                ),
              ),
              actions: [
                FloatingActionButton(
                  backgroundColor: const Color(0xFFfdfdfd),
                  elevation: 0,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Sort by',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Change list name',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Delete list',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Delete all completed tasks',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                ),
              ],
              elevation: 0,
              backgroundColor: const Color(0xFFfdfdfd),
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int i = 0; i < taskInfo.length; i++)
                      RadioCustom(
                        titleName: taskInfo[i]['taskname'],
                        subtitileName: taskInfo[i]['time'],
                        removeTask: () {
                          removeTask(i);
                        },
                      ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 15),
                      height: 1,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Color(0xFFe2e2e3)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Done(2)',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.expand_less),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              heroTag: UniqueKey().toString(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OpenTaskScreen(
                            index: 0,
                            isCreate: false,
                            name: 'Toan',
                            time: '2023/03/10',
                          )),
                );
              },
              backgroundColor: const Color(0xFF9088d4),
              child: const Icon(Icons.add),
            ),
          );
  }

  void setTask() {
    List taskInfoTemp = jsonDecode(prefs.getString('listTask') ?? '[]');
    if (taskInfoTemp.isNotEmpty) {
      taskInfo = taskInfoTemp;
    }
  }

  void removeTask(int index) {
    List taskInfoTemp = jsonDecode(prefs.getString('listTask') ?? '[]');
    if (taskInfoTemp.isNotEmpty) {
      taskInfoTemp.removeAt(index);
      setState(() {
        taskInfo.clear();
        taskInfo = taskInfoTemp;
      });
      prefs.setString('listTask', jsonEncode(taskInfo));
    }
  }
}
