import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
     required this.onTap
     });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

  class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(); // Corrected the typo
  final TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 16), // Space between logo and text

            Text(
              "Let's creats an accoun for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 16),

            MyTextfield(
              controller: emailController,
              hinttext: "Email",
              obscuretext: false,
            ),

            const SizedBox(height: 16), // Space between text fields

            MyTextfield(
              controller: passwordController, // Corrected the controller name
              hinttext: "Password", // Corrected the spelling
              obscuretext: true,
            ),
             const SizedBox(height: 16), // Space between text fields

            MyTextfield(
              controller: confirmpasswordController, // Corrected the controller name
              hinttext: "confirmPassword", // Corrected the spelling
              obscuretext: true,
            ),

            const SizedBox(height: 16),

            MyButton(
              text: "Sign Up",
              onTap: () {}, // You can add the actual logic here
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an accont?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(width: 4),

                GestureDetector(
                  onTap: () {
                    // Handle tap for "Register now"
                    if (widget.onTap != null) {
                      widget.onTap!(); // Ensure it's not null
                    }
                  },
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
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
