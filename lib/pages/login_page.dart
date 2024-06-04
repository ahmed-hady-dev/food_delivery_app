import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
            text: 'Sign in',
            onTap: () {},
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
                onTap: onTap,
                child: Text(
                  'Not a member?',
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
