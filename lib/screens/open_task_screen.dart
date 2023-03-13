import 'package:flutter/material.dart';

class OpenTaskScreen extends StatefulWidget {
  const OpenTaskScreen({super.key});

  @override
  State<OpenTaskScreen> createState() => _OpenTaskScreen();
}

class _OpenTaskScreen extends State<OpenTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 250),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.check,
                color: Color(0xFF7f8083),
                size: 30,
              ),
              Icon(
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
          alignment: Alignment.centerRight,
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
                children: const [
                  Text(
                    'Praktikum Module 3',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xFFdfdfe0),
                    size: 30,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Color(0xFF9088d4),
                    size: 30,
                  ),
                  SizedBox(width: 15),
                  Expanded(
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
                        hintText: 'Set time',
                        filled: true,
                        fillColor: const Color(0xFFe7e6f5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.east,
                    color: Color(0xFF7f8184),
                    size: 30,
                  ),
                  SizedBox(width: 15),
                  Expanded(
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
                        hintText: 'Add sub tasks',
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
}
