import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reel_view/reel_view/reel_view.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _LoginState();
}

class _LoginState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  final String validEmail = 'abc12@gmail.com';
  final String validPassword = '12345';

  void handleLogin()async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // if (email == validEmail && password == validPassword) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => ReelsView(
    //               videoUrl: '',
    //             )),
    //   );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Failed To Verify Your Identity')),
    //   );
    // }
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,password:passwordController.text,

  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://images.pexels.com/photos/2882566/pexels-photo-2882566.jpeg',
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Signup',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() => isPasswordVisible = !isPasswordVisible);
                  },
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: handleLogin,
              child: Text(
                'Signup',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}