import 'package:atbeach/screens/login_view.dart';
import 'package:flutter/material.dart';
import '../widget/app_color_theme.dart';
import 'package:atbeach/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _auth = FirebaseAuth.instance;

  // form key
  final _formKey = GlobalKey<FormState>();

  final usernameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColorTheme.primaryDark,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0XFFE8ECF4), width: 4)),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new,
                            color: Colors.white, size: 24),
                        onPressed: () => {Navigator.pop(context)},
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text('Hello! Register to get started',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    const SizedBox(height: 40),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              autofocus: false,
                              controller: usernameEditingController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ('Username is required');
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Please write your username atleast 6 characters long");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                usernameEditingController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFF7F8F9),
                                hintText: 'Enter you username',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                          const SizedBox(height: 20),
                          TextFormField(
                              autofocus: false,
                              controller: emailEditingController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('Please enter your email');
                                }
                                // reg expression for email validation
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ('Please enter a valid email');
                                }
                                return null;
                              },
                              onSaved: (value) {
                                emailEditingController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFF7F8F9),
                                hintText: 'Enter you email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                          const SizedBox(height: 20),
                          TextFormField(
                              autofocus: false,
                              controller: passwordEditingController,
                              obscureText: true,
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ('Password is required');
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Please write your password atleast 6 characters long");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                passwordEditingController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFF7F8F9),
                                hintText: 'Enter you password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                          const SizedBox(height: 20),
                          TextFormField(
                              autofocus: false,
                              controller: confirmPasswordEditingController,
                              obscureText: true,
                              validator: (value) {
                                if (value == null) {
                                  return 'Please confirm your password';
                                }
                                if (confirmPasswordEditingController.text !=
                                    passwordEditingController.text) {
                                  return "Password don't match";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                confirmPasswordEditingController.text = value!;
                              },
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFF7F8F9),
                                hintText: 'Confirm your password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                          const SizedBox(height: 60),
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                                onPressed: () {
                                  signUp(emailEditingController.text,
                                      passwordEditingController.text);
                                },
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: AppColorTheme.secondaryDark,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Register',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Already have an account?',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: AppColorTheme.line)),
                              TextButton(
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginView()))
                                },
                                child: const Text('Log in',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: AppColorTheme.line)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    String confimPass = confirmPasswordEditingController.text.toString();
    if (password != confimPass) {
      Fluttertoast.showToast(msg: 'Password did not match');
      return;
    }
    if (_formKey.currentState!.validate()) {}
    await _auth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  postDetailsToFirestore() async {
    // calling firestore
    // calling user model
    // searching the values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameEditingController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Account created successfully');

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginView()), (route) => false);
  }
}
