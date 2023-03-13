import 'package:flutter/material.dart';

class TaskMenu extends StatefulWidget {
  const TaskMenu({super.key});

  @override
  State<TaskMenu> createState() => _TaskMenuState();
}

class _TaskMenuState extends State<TaskMenu> {
  int _subject = 0;
  DateTime _dateTime = DateTime.now();

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
        leading: Container(
          margin: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF919399),
            ),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF4e5158),
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
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: const Text('Praktikum Module 3')),
                subtitle: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      height: 25,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: const Color(0xFF9088d4),
                      ),
                      child: const Text('Today | 23.59',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const Spacer()
                  ],
                ),
                value: 0,
                groupValue: _subject,
                onChanged: (newValue) {
                  setState(() {
                    _subject = int.parse(newValue.toString());
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: const Text('Interaksi Manusia dan Komputer')),
                subtitle: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      height: 25,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: const Color(0xFF9088d4),
                      ),
                      child: const Text('Monday, 24 Sept 2020 | 23.59',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const Spacer()
                  ],
                ),
                value: 1,
                groupValue: _subject,
                onChanged: (newValue) {
                  setState(() {
                    _subject = int.parse(newValue.toString());
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: const Text('Jangringan Komputer')),
                subtitle: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      height: 25,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: const Color(0xFF9088d4),
                      ),
                      child: const Text('Friday, 28 Sept 2020 | 23.59',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const Spacer()
                  ],
                ),
                value: 2,
                groupValue: _subject,
                onChanged: (newValue) {
                  setState(() {
                    _subject = int.parse(newValue.toString());
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: const Text('Interaksi Manusia dan Komputer')),
                subtitle: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      height: 25,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: const Color(0xFF9088d4),
                      ),
                      child: const Text('Saturday, 29 Sept 2020 | 23.59',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const Spacer()
                  ],
                ),
                value: 3,
                groupValue: _subject,
                onChanged: (newValue) {
                  setState(() {
                    _subject = int.parse(newValue.toString());
                  });
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
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.only(top: 20, left: 25),
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'New Task',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 360,
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'New Task',
                          filled: true,
                          fillColor: const Color(0xFFe7e6f5),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _showDatePicker,
                          icon: const Icon(
                            Icons.calendar_month,
                            color: Color(0xFF9088d4),
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          color: Color(0xFFdfdfe0),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20, left: 245),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFdfdfe0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: const Color(0xFF9088d4),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDatePicker() {
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
