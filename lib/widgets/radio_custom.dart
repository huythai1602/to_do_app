import 'package:flutter/material.dart';

class RadioCustom extends StatefulWidget {
  final String titleName;
  final String subtitileName;
  final VoidCallback removeTask;
  const RadioCustom(
      {super.key,
      required this.titleName,
      required this.subtitileName,
      required this.removeTask});

  @override
  State<RadioCustom> createState() => _RadioCustomState();
}

class _RadioCustomState extends State<RadioCustom> {
  bool navigateToPage = false;
  int _subject = 0;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        contentPadding: EdgeInsets.zero,
        title: Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: Text(
            widget.titleName,
            style: const TextStyle(color: Colors.black),
          ),
        ),
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
              child: Text(widget.subtitileName,
                  style: const TextStyle(color: Colors.white)),
            ),
            const Spacer()
          ],
        ),
        secondary:
            InkWell(child: const Icon(Icons.delete), onTap: widget.removeTask),
        value: 0,
        groupValue: _subject,
        onChanged: (newValue) {
          setState(
            () {},
          );
        });
  }
}
