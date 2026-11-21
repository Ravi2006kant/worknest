import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_workspace/services/auth_service.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool isloading = false;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget Password')),
      body: Column(
        mainAxisAlignment: .start,
        children: [
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      keyboardType: .emailAddress,
                      controller: emailController,

                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }

                        if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                            .hasMatch(value.trim())) {
                          return 'Enter a valid email address';
                        }

                        return null;
                      },
                    ),
                  ),

                  ElevatedButton(
                    onPressed: isloading ? null : () async {
                      if (emailController.text.isEmpty) {
                        showTopSnackBar(
                          Overlay.of(context),
                          Material(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.red.shade500,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Fill the Email first',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: .bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      try {
                        setState(() {
                          isloading = true;
                        });
                        await  AuthService().forgetPassword(
                          emailController.text.trim(),
                        );
                        showTopSnackBar(
                          Overlay.of(context),
                          Material(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.green.shade500,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Reset link sent! Check your Gmail',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: .bold,
                                ),
                              ),
                            ),
                          ),
                        );

                      } on FirebaseAuthException catch (e) {
                        switch (e.code) {
                          case 'invalid-email':
                            showError('Please enter a valid email address.');
                            break;

                          case 'user-not-found':
                            showError('No account found with this email.');
                            break;

                          case 'too-many-requests':
                            showError(
                              'Too many attempts. Please try again later.',
                            );
                            break;

                          case 'network-request-failed':
                            showError('Check your internet connection.');
                            break;

                          default:
                            showError(
                              'Something went wrong. Please try again.',
                            );
                        }
                      } catch (e) {
                        showError('Something went wrong. Please try again.');
                      } finally {
                        if (mounted) {
                          setState(() {
                            isloading = false;
                          });
                        }
                      }


                    },
                    child: isloading
                        ? CircularProgressIndicator()
                        : Text('Send Password Reset Link'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showError(String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
  }
}
