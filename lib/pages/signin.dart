// UI page for signin
// singin is same as signup but without the password verfication

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/sign_provider.dart';

class Singin extends StatelessWidget {
  Singin({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var keyForm =
      GlobalKey<FormState>(); // defining global form key to be used in From

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signin Page"),
      ),
      body: SafeArea(
        child: Form(
          key: keyForm,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username", hintText: "username"),
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required field";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Password", hintText: "password"),
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required field";
                    }
                    // if (value != passwordController) {
                    //   return "Password does not match";
                    // }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (keyForm.currentState!.validate()) {
                        var signed = await context.read<SignProvider>().signin(
                            username: usernameController.text,
                            password: passwordController
                                .text); // calling the provider

                        print("+++++++++++++++++++++++++++++++");
                        print("           ");
                        print("i'm here");
                        print("           ");
                        print("+++++++++++++++++++++++++++++++");

                        if (signed == null) {
                          context.pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("You did not signin ")));
                        }
                      }
                    },
                    child: Text("Signin")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
