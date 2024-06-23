import 'package:easeup/core/navigation/routes_name.dart';
import 'package:easeup/modules/authentication/viewmodels/authentication_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'easeup',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            margin: const EdgeInsets.all(18),
            color: Colors.teal.shade200,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailTextController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordTextController,
                      decoration: const InputDecoration(
                        hintText: 'password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final email = emailTextController.text;
                            final password = passwordTextController.text;

                            final viewmodel =
                                Provider.of<AuthenticationViewModel>(
                              context,
                              listen: false,
                            );

                            final success =
                                await viewmodel.loginWithEmailAndPassword(
                              email,
                              password,
                            );

                            if (success) {
                              if (!context.mounted) return;
                              Navigator.pushNamed(
                                  context, RoutesName.dashboard);
                            } else {
                              if (!context.mounted) return;
                              _showErrorDialog(
                                context,
                                viewmodel.errorMessage,
                              );
                            }
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.register,
                            );
                          },
                          child: const Text(
                            'New here? Please Register',
                            style: TextStyle(),
                          ),
                        ),
                        const Text('  /  '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.forgotPassword,
                            );
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {
                          final viewModel =
                              Provider.of<AuthenticationViewModel>(
                            context,
                            listen: false,
                          );
                          viewModel.readFirestoreData();
                        },
                        child: const Text('Check Firebase'),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
