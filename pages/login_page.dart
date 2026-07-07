import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwoldcontroller = TextEditingController();
  
  //login method
  void login(){
    
    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const HomePage(), 
  ),
);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // โลโก้
            Icon(
              Icons.lock_open_rounded, // ใช้ Icons.lock_open_rounded
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 16), // เพิ่มพื้นที่ระหว่างไอคอนกับข้อความ

            Text(
              "Easywash",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 16),

            MyTextfield(
              controller: emailcontroller,
              hinttext: "Email",
              obscuretext: false,
            ),

            const SizedBox(height: 16), // เพิ่มพื้นที่ระหว่าง Textfield

            MyTextfield(
              controller:
                  passwoldcontroller, 
              hinttext: "passwold",
              obscuretext: true,
            ),

            const SizedBox(height: 16),

            MyButton(text: "Sign In", 
            onTap: login), 
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold ),
                  ),
                ),
                
              ],
            ),

            // Additional widgets here...
          ],
        ),
      ),
    );
  }
}
