import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_workspace/component/btn.dart';
import 'package:freelancer_workspace/pages/auth/forget_password.dart';
import 'package:freelancer_workspace/pages/auth/login_screen.dart';
import 'package:freelancer_workspace/services/auth_service.dart';

import '../../component/auth_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isloading = false;
  final nameController = TextEditingController();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final passtwocontroller = TextEditingController();
  void showError(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void nextScreen(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    passtwocontroller.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Text("Register", style: TextStyle(fontWeight: .bold, fontSize: 25)),
          Text("Please Sign in to Continue"),
          //full name
          AuthTextfield(
            cont: nameController,
            hint: "Full Name",
            ico: 0,
            ob: false,
            validators: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          //email
          AuthTextfield(
            validators: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            cont: emailcontroller,
            hint: "Email",
            ico: 1,
            ob: false,
          ),
          SizedBox(height: 10),
          //password
          AuthTextfield(
            validators: (value) {
              return "Password is required";
            },
            cont: passcontroller,
            hint: "Password",
            ico: 2,
            ob: true,
          ),
          //confirm password
          AuthTextfield(
            validators: (value) {
              return "Password is required";
            },
            cont: passtwocontroller,
            hint: "Confirm Password",
            ico: 2,
            ob: true,
          ),
Btn(txt: "Register",onPress: isloading ? null : () async {


  try {
    if(passcontroller.text != passtwocontroller.text){
      showError('Password Not Match');
      return;
    }  setState(() {
      isloading = true;
    });
    await AuthService().register(
      emailcontroller.text.trim(),
      passcontroller.text.trim(),
    );
    nextScreen();


  } on FirebaseAuthException catch (e) {
    print(e.code);
    switch (e.code) {
      case 'email-already-in-use':
        showError('This email is already registered.');
        break;

      case 'invalid-email':
        showError('Please enter a valid email address.');
        break;

      case 'weak-password':
        showError('Password is too weak. Use a stronger password.');
        break;

      case 'operation-not-allowed':
        showError('Email and password registration is unavailable.');
        break;

      case 'network-request-failed':
        showError('Network error. Check your internet connection.');
        break;

      case 'too-many-requests':
        showError('Too many attempts. Please try again later.');
        break;

      default:
        showError('Something went wrong. Please try again.');
    }
  }catch (e) {
    showError('Something went wrong. Please try again.');
  }
  finally {
    if (mounted) {
      setState(() {
        isloading = false;
      });

    }
  }
},),
          // ElevatedButton(
          //     onPressed: isloading ? null : () async {
          //
          //
          //     try {
          //       if(passcontroller.text != passtwocontroller.text){
          //        showError('Password Not Match');
          //        return;
          //       }  setState(() {
          //         isloading = true;
          //       });
          //       await AuthService().register(
          //         emailcontroller.text.trim(),
          //         passcontroller.text.trim(),
          //       );
          //       nextScreen();
          //
          //
          //     } on FirebaseAuthException catch (e) {
          //       print(e.code);
          //       switch (e.code) {
          //         case 'email-already-in-use':
          //           showError('This email is already registered.');
          //           break;
          //
          //         case 'invalid-email':
          //           showError('Please enter a valid email address.');
          //           break;
          //
          //         case 'weak-password':
          //           showError('Password is too weak. Use a stronger password.');
          //           break;
          //
          //         case 'operation-not-allowed':
          //           showError('Email and password registration is unavailable.');
          //           break;
          //
          //         case 'network-request-failed':
          //           showError('Network error. Check your internet connection.');
          //           break;
          //
          //         case 'too-many-requests':
          //           showError('Too many attempts. Please try again later.');
          //           break;
          //
          //         default:
          //           showError('Something went wrong. Please try again.');
          //       }
          //     }catch (e) {
          //       showError('Something went wrong. Please try again.');
          //     }
          //     finally {
          //     if (mounted) {
          //     setState(() {
          //     isloading = false;
          //     });
          //
          //     }
          //     }
          //   },
          //   child:isloading ? CircularProgressIndicator(): Text("Sign Up"),
          // ),
        ],
      ),
    );
  }
}
