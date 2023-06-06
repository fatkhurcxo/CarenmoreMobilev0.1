import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  bool _passwordVisibility = true;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
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
                    'Sign in to continue',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _textController1,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _textController2,
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
                        onTap: () => setState(() => _passwordVisibility = !_passwordVisibility),
                        child: Icon(
                          _passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, 'menu');
                  },
                  child: Text('Sign in'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(130, 40),
                    primary: Color(0xFF2F9DF5),
                    textStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
    );
  }
}
