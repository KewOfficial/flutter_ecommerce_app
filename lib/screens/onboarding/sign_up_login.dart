
import 'package:flutter/material.dart';

class SignUpLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up / Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String enteredEmail = 'kew@email.com';
                String enteredPassword = 'password123';
                bool isValidCredentials = validateCredentials(enteredEmail, enteredPassword);
                if (isValidCredentials) {
                  Navigator.pushNamed(context, '/home');
                } else {
                  Navigator.pushReplacementNamed(context, '/signup');
                }
              },
              style: ElevatedButton.styleFrom(),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String enteredEmail = 'newuser@email.com';
                String enteredPassword = 'password123';
                String enteredConfirmPassword = 'password123';
                bool isValidSignUp = validateSignUp(enteredEmail, enteredPassword, enteredConfirmPassword);
                if (isValidSignUp) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  Navigator.pushNamed(context, '/signup');
                }
              },
              style: ElevatedButton.styleFrom(),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateCredentials(String email, String password) {
    return email == 'kew@email.com' && password == 'password123';
  }

  bool validateSignUp(String email, String password, String confirmPassword) {
    return email.isNotEmpty && password == confirmPassword;
  }
}
