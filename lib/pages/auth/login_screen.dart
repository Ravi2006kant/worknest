import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_workspace/component/auth_textfield.dart';
import 'package:freelancer_workspace/home.dart';
import 'package:freelancer_workspace/pages/auth/forget_password.dart';
import 'package:freelancer_workspace/pages/auth/register_screen.dart';
import 'package:freelancer_workspace/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLoading = false;
  void showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();

    void nextScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: .center,

        children: [
          Text("Login", style: TextStyle(fontSize: 20, fontWeight: .bold)),
          Text("Please Sign in to Continue"),
          AuthTextfield(
            validators: (value) {
              if (value == null || value.isEmpty || value == "") {
                return 'Email is required';
              }
              return null;
            },
            cont: emailController,
            hint: 'Email',

            ico: 0,
            ob: false,
          ),
          SizedBox(height: 10),
          AuthTextfield(
            validators: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            cont: passController,
            hint: 'Password',
            ico: 1,
            ob: true,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgetPassword()),
              );
            },
            child: Text("Forget Password"),
          ),

          ElevatedButton(
            onPressed: isLoading ? null : () async {
              setState(() {
                isLoading = true;
              });
              try {
                await AuthService().login(
                  emailController.text.trim(),
                  passController.text.trim(),
                );

                nextScreen();
              } on FirebaseAuthException catch (e) {
                switch (e.code) {
                  case 'user-not-found':
                    showError('Account not found');
                    break;

                  case 'wrong-password':
                    showError('Incorrect password');
                    break;

                  case 'invalid-credential':
                    showError('Invalid email or password');
                    break;

                  case 'invalid-email':
                    showError('Invalid email address');
                    break;

                  case 'too-many-requests':
                    showError('Too many attempts. Please try again later.');
                    break;

                  default:
                    showError('Something went wrong. Please try again.');
                }
              } catch (e) {
                showError('Something went wrong. Please try again.');
              } finally {
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              }
            },
            child: isLoading ? CircularProgressIndicator() : Text('Login'),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: Text.rich(
              TextSpan(
                text: 'Don\'t have an Account',
                children: [
                  TextSpan(
                    text: '  SignUp',
                    style: TextStyle(fontWeight: .bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
