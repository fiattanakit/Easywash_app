import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final bool obscuretext;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.obscuretext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscuretext, // แก้ไขจาก `obscuretext` เป็น `obscureText`
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme .tertiary), // ใช้ tertiary หากรองรับ
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.primary), // ขอบเมื่อมีการโฟกัส
          ),
        hintText: hinttext, // เปลี่ยนจาก hinttext เป็น hintText
      hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), // ใช้ primary จาก ColorScheme
    ),
  )
    );
}
}