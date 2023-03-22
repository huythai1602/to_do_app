import 'package:flutter/material.dart';

import '../screens/task_menu.dart';

class TaskCustom extends StatelessWidget {
  final Color taskColor;
  final String taskName;
  final Widget taskIcon;
  const TaskCustom(
      {super.key,
      required this.taskColor,
      required this.taskIcon,
      required this.taskName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TaskMenu()),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: taskColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFfdfdfd)),
              child: taskIcon,
            ),
            const SizedBox(height: 10),
            Text(
              taskName,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFf9e4d6)),
            ),
          ],
        ),
      ),
    );
  }
}
