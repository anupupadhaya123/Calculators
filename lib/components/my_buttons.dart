import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String title;
  final Color colors;
  final VoidCallback onPress;
  const MyButtons(
      {Key? key,
      required this.title,
      this.colors = const Color(0xffa5a5a5),
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: colors,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
