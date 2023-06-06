import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late TextEditingController _textController3;
  late TextEditingController _textController4;
  late TextEditingController _textController5;
  bool _passwordVisibility1 = true;
  bool _passwordVisibility2 = true;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    _textController4 = TextEditingController();
    _textController5 = TextEditingController();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    _textController5.dispose();
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic
    }
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
              child: Form(
                key: _formKey,
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
                      controller: _textController1,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person_sharp),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _textController3,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone, size: 20),
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _textController4,
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
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _textController5,
                      obscureText: _passwordVisibility2,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: _submitForm,
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
                            Navigator.of(context).pushNamed('login');
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
            ),
          ),
        ),
      ),
    );
  }
}