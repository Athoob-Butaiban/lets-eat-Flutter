import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Form(
        // key: ,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(hintText: "Username"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(hintText: "Confirm Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }

                  if (value != passwordController) {
                    return "Password does not match";
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Signup"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
