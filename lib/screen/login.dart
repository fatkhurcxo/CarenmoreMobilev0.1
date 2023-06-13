import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/models/loginstful.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  bool _passwordVisibility = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Welcome to Carenmore',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: email,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                      ),
                      style: TextStyle(fontSize: 14),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Anda harus mengisi alamat email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: password,
                      obscureText: _passwordVisibility,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        prefixIcon: Icon(Icons.lock_outlined),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                              () => _passwordVisibility = !_passwordVisibility),
                          child: Icon(
                            _passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      style: TextStyle(fontSize: 14),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Anda harus mengisi password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      if (loginKey.currentState!.validate()) {
                        LoginStful.loginApi(email.text, password.text)
                            .then((value) {
                          if (value.login) {
                            Navigator.pushNamed(
                              context,
                              'menu',
                              arguments: value.userId,
                            );

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                    'Successful Authentication',
                                    style: TextStyle(color: Colors.green),
                                    textAlign: TextAlign.center,
                                  ),
                                  // backgroundColor: Colors.blue.withOpacity(0.7),
                                  icon: Icon(Icons.check_circle_outline_rounded,
                                      color: Colors.green),
                                );
                              },
                            );
                          } else if (!value.login) {
                            Flushbar(
                              title: "Message from Ojak",
                              message: "Username atau password salah!",
                              backgroundColor: Colors.red.withOpacity(0.7),
                              duration: Duration(seconds: 5),
                            ).show(context);
                          }
                        });
                      } else {
                        Flushbar(
                          title: "Message from Ojak",
                          message: "Semua field harus terisi!",
                          backgroundColor: Colors.red.withOpacity(0.7),
                          duration: Duration(seconds: 5),
                        ).show(context);
                      }
                      // Navigator.pushNamed(context, 'menu');
                    },
                    child: Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(130, 40),
                      primary: Color(0xFF2F9DF5),
                      textStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('register');
                        },
                        child: Text(
                          'Sign Up',
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
          ),
        ),
      ),
    );
  }
}
