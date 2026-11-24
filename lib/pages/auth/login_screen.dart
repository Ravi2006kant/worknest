import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_workspace/component/auth_textfield.dart';
import 'package:freelancer_workspace/component/btn.dart';
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
      body: Stack(
        children: [
          // Top-left circle
          Positioned(
            top: -50,
            right: -30,
            child: Container(
              height: 130,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: .4),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Top-right circle
          Positioned(
            top: -70,
            right: -40,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Your login page content
          Column(
            children: [
              SizedBox(height: 200),

              Text(
                "Welcome Back 👋",
                style: TextStyle(fontSize: 25, fontWeight: .bold),
              ),
              Text("Sign in to Continue"),
              SizedBox(height: 25),
              AuthTextfield(
                validators: (value) {
                  if (value == null || value.isEmpty || value == "") {
                    return 'Email is required';
                  }
                  return null;
                },
                cont: emailController,
                hint: 'Email Address',

                ico: 1,
                ob: false,
              ),

              AuthTextfield(
                validators: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                cont: passController,
                hint: 'Password',
                ico: 2,
                ob: true,
              ),
              Row(
                mainAxisAlignment: .end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forget Password",
                        style: TextStyle(color: Colors.blue, fontWeight: .bold),
                      ),
                    ),
                  ),
                ],
              ),
              Btn(
                txt: "Sign In",
                onPress: isLoading
                    ? null
                    : () async {
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
                              showError(
                                'Too many attempts. Please try again later.',
                              );
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
                              isLoading = false;
                            });
                          }
                        }
                      },
              ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20),
              //       child: SizedBox(
              //         width: .infinity,
              // height: 50,
              //         child: ElevatedButton(
              //
              //           style: ButtonStyle(
              //             elevation: WidgetStatePropertyAll(0),
              //             backgroundColor: WidgetStatePropertyAll(Colors.blue),
              //             shape: WidgetStatePropertyAll(
              //               RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //             ),
              //           ),
              //           onPressed: isLoading
              //               ? null
              //               : () async {
              //             setState(() {
              //               isLoading = true;
              //             });
              //             try {
              //               await AuthService().login(
              //                 emailController.text.trim(),
              //                 passController.text.trim(),
              //               );
              //
              //               nextScreen();
              //             } on FirebaseAuthException catch (e) {
              //               switch (e.code) {
              //                 case 'user-not-found':
              //                   showError('Account not found');
              //                   break;
              //
              //                 case 'wrong-password':
              //                   showError('Incorrect password');
              //                   break;
              //
              //                 case 'invalid-credential':
              //                   showError('Invalid email or password');
              //                   break;
              //
              //                 case 'invalid-email':
              //                   showError('Invalid email address');
              //                   break;
              //
              //                 case 'too-many-requests':
              //                   showError(
              //                     'Too many attempts. Please try again later.',
              //                   );
              //                   break;
              //
              //                 default:
              //                   showError(
              //                     'Something went wrong. Please try again.',
              //                   );
              //               }
              //             } catch (e) {
              //               showError(
              //                 'Something went wrong. Please try again.',
              //               );
              //             } finally {
              //               if (mounted) {
              //                 setState(() {
              //                   isLoading = false;
              //                 });
              //               }
              //             }
              //           },
              //           child: isLoading
              //               ? CircularProgressIndicator()
              //               : Text(
              //             'Sign In',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: .bold,
              //               fontSize: 17
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: Divider(indent: 20, endIndent: 10)),

                  Text("or continue with"),
                  Expanded(child: Divider(indent: 10, endIndent: 20)),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {}, child: Text("Google")),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an Account? ',
                    style: TextStyle(color: Colors.grey.shade600),
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(color: Colors.blue, fontWeight: .bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
