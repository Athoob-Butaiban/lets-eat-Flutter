import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/sign_provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
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
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required field";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                  ),
                  obscureText: true,
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
                SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var signed = await context.read<SignProvider>().sign(
                          username: usernameController.text,
                          password: passwordController.text);
                      print("================================== ");
                      print("$signed");
                      print("================================== ");

                      // calling the provider
                      if (signed) {
                        context.go("/HomePage");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("You did not signup ")));
                      }
                    }
                  },
                  child: Text("Signup"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
