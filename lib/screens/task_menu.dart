import 'package:flutter/material.dart';

class TaskMenu extends StatefulWidget {
  const TaskMenu({super.key});

  @override
  State<TaskMenu> createState() => _TaskMenuState();
}

class _TaskMenuState extends State<TaskMenu> {
  int _subject = 0;

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
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF919399),
            ),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF4e5158),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: const Color(0xFF4e5158),
          ),
        ],
        elevation: 0,
        backgroundColor: const Color(0xFFfdfdfd),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile(
                title: const Text('Praktikum Module 3'),
                subtitle: const Text('Today | 23.59'),
                value: 0,
                groupValue: _subject,
                onChanged: (newValue) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
