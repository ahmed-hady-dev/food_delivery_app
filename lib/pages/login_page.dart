import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_text_field.dart';
import 'package:food_delivery_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  void login() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.lock_open_rounded, size: 100, color: Theme.of(context).colorScheme.inversePrimary),
          const SizedBox(height: 25),
          Text('Food Delivery App',
              style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary)),
          const SizedBox(height: 25),
          MyTextField(controller: emailController, hint: 'Email', obscureText: false),
          const SizedBox(height: 10),
          MyTextField(controller: passwordController, hint: 'Password', obscureText: true),
          const SizedBox(height: 25),
          MyButton(
            text: 'Sign In',
            onTap: () => login(),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Not a member?',
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  'Register now',
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
