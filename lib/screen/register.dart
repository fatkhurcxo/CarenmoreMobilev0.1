import 'dart:io';

import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:tugasakhir/models/registerstful.dart';
import '../providers/auth.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  /* register variable data */

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool _passwordVisibility1 = true;
  bool _passwordVisibility2 = true;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility1() {
    setState(() {
      _passwordVisibility1 = !_passwordVisibility1;
    });
  }

  void _togglePasswordVisibility2() {
    setState(() {
      _passwordVisibility2 = !_passwordVisibility2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
              /* form register */
              child: Form(
                key: _registerKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/images/logo.png"),
                    const SizedBox(height: 10),
                    Text(
                      'Create a new account',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: name,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Nama Lengkap',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      /* validator */
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Anda harus mengisi nama lengkap';
                        }
                        return null;
                      },
                      // onSaved: (newValue) => name = newValue,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: email,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.person_sharp),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Anda harus mengisi alamat email';
                        }
                        return null;
                      },
                      // onSaved: (newValue) => email = newValue,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: password,
                      obscureText: _passwordVisibility1,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_open),
                        suffixIcon: InkWell(
                          onTap: _togglePasswordVisibility1,
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _passwordVisibility1
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Anda harus mengisi password';
                        }
                        return null;
                      },
                      // onSaved: (newValue) => password = newValue,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: confirmPassword,
                      obscureText: _passwordVisibility2,
                      decoration: InputDecoration(
                        hintText: 'Konfirmasi Password',
                        prefixIcon: Icon(Icons.lock_outlined),
                        suffixIcon: InkWell(
                          onTap: _togglePasswordVisibility2,
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _passwordVisibility2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Anda harus menuliskan ulang password';
                        }
                        return null;
                      },
                      // onSaved: (newValue) => confirmPassword = newValue,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        /* validate */
                        if (_registerKey.currentState!.validate()) {
                          /* confirmed check */
                          if (password.text != confirmPassword.text) {
                            Flushbar(
                              title: "Message from Ojak:",
                              titleColor: Colors.black,
                              message: 'Konfirmasi password anda tidak sesuai!',
                              messageColor: Colors.black,
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.yellow.withOpacity(0.8),
                            ).show(context);
                          } else {
                            /* register func */
                            RegisterStful.regisAPI(
                                    name.text, email.text, password.text)
                                .then((value) {
                              if (value.create) {
                                Navigator.of(context).pop();

                                Flushbar(
                                  title: "Message from Ojak",
                                  message:
                                      "Berhasil membuat akun, silahkan login menggunakan email terdaftar.",
                                  duration: Duration(seconds: 10),
                                  backgroundColor:
                                      Colors.green.withOpacity(0.8),
                                ).show(context);
                              }
                            });
                          }
                        } else {
                          Flushbar(
                            title: "Message from Ojak:",
                            message: 'Seluruh field tidak boleh kosong!',
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red.withOpacity(0.8),
                          ).show(context);
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /* end form register */
            ),
          ),
        ),
      ),
    );
  }
}
