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
  DateTime _dateTime = DateTime.now();
  late final TextEditingController newController;
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => prefs = value);
    newController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Change list name',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Delete list',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Delete all completed tasks',
                        style: TextStyle(fontSize: 18, color: Colors.black),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RadioCustom(
                titleName: 'Praktikum Module 3',
                subtitileName: 'Today | 23.59',
              ),
              const RadioCustom(
                titleName: 'Interaksi Manusia dan Komputer',
                subtitileName: 'Monday, 24 Sept 2020 | 23.59',
              ),
              const RadioCustom(
                titleName: 'Jangringan Komputer',
                subtitileName: 'Friday, 28 Sept 2020 | 23.59',
              ),
              const RadioCustom(
                titleName: 'Interaksi Manusia dan Komputer',
                subtitileName: 'Saturday, 29 Sept 2020 | 23.59',
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            MaterialPageRoute(builder: (context) => const OpenTaskScreen()),
          );
        },
        backgroundColor: const Color(0xFF9088d4),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }
}
