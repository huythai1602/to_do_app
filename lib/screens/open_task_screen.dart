import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpenTaskScreen extends StatefulWidget {
  const OpenTaskScreen({super.key});

  @override
  State<OpenTaskScreen> createState() => _OpenTaskScreen();
}

class _OpenTaskScreen extends State<OpenTaskScreen> {
  DateTime selectedDate = DateTime.now();
  bool isFirst = true;
  final TextEditingController taskcontroller = TextEditingController();
  final TextEditingController timecontroller = TextEditingController();
  late final SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => prefs = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 250),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: addTask,
                child: const Icon(
                  Icons.check,
                  color: Color(0xFF7f8083),
                  size: 30,
                ),
              ),
              const Icon(
                Icons.delete,
                color: Color(0xFF7f8083),
                size: 30,
              ),
            ],
          ),
        ),
        toolbarHeight: 100,
        leading: Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Color(0xFF9088d4),
                    size: 30,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFe7e6f5),
                        ),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        child: Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: Text(
                            isFirst
                                ? 'Set time'
                                : dateTimeConvert(selectedDate),
                            style: const TextStyle(
                                fontSize: 17, color: Color(0xFF7b7f88)),
                          ),
                        ),
                      ),
                      onTap: () => _selectDate(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.east,
                    color: Color(0xFF7f8184),
                    size: 30,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      controller: taskcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Add tasks',
                        filled: true,
                        fillColor: const Color(0xFFe7e6f5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    if (isFirst) {
      setState(() {
        isFirst = false;
      });
    }
  }

  String dateTimeConvert(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  void addTask() async {
    String addtask = taskcontroller.text;
    String addtime = selectedDate.toString();
    Map<String, Object> task = {
      'taskname': addtask,
      'time': addtime,
      'radio': true
    };
    List<Map<String, Object>> listTask = [];
    listTask.add(task);
    await prefs.setString('listTask', listTask.toString());
  }
}
