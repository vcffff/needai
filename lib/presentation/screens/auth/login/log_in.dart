import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:needai/app.dart';
import 'package:needai/data/services/firebase_services.dart';
import 'package:needai/presentation/screens/firstpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOrSign extends StatefulWidget {
  final bool isSigned;
  const LogOrSign({super.key, required this.isSigned});

  @override
  State<LogOrSign> createState() => _LogOrSignState();
}

class _LogOrSignState extends State<LogOrSign> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checklogin();
  }

  Future<void> checklogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isloggedin = prefs.getBool('isloggedin') ?? false;
    if (isloggedin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Firstpage()),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print('Sign in aborted by user');
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      print(userCredential.user?.displayName);
    } catch (e) {
      print('Error during Google Sign-In: $e');
    }
  }

  void registerButtonAction() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill in both fields.")));
      return;
    }

    bool isregister = await Firebaseservices().register(
      email: email,
      password: password,
    );
    if (isregister) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed. Please try again.")),
      );
    }
  }

  void loginButtonAction() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill in both fields.")));
      return;
    }

    bool logined = await Firebaseservices().authbyemail(
      email: email,
      password: password,
    );
    if (logined) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isloggedin', true);
      print(prefs);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed. Please check your credentials.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 242, 1),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 150,
            color: Color.fromRGBO(240, 240, 242, 1),
            child: Align(
              alignment: Alignment.bottomLeft,
              child:
                  widget.isSigned
                      ? Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                      : Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your  Email',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 3),
                                  TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 18.0,
                                        horizontal: 16.0,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFD3D3D3),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFF3D5CFF),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 3),
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            vertical: 18.0,
                                            horizontal: 16.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFD3D3D3),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFF3D5CFF),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              FilledButton(
                                onPressed: () {
                                  widget.isSigned
                                      ? loginButtonAction()
                                      : registerButtonAction();
                                },

                                style: FilledButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(
                                    61,
                                    92,
                                    255,
                                    1,
                                  ),
                                  minimumSize: Size(double.infinity, 60),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Color.fromRGBO(61, 92, 255, 1),
                                    ),
                                  ),
                                ),
                                child:
                                    widget.isSigned
                                        ? Text('Log In')
                                        : Text('Sign Up'),
                              ),
                              Divider(
                                color: const Color.fromARGB(255, 137, 137, 137),
                                height: 36,
                              ),
                              widget.isSigned
                                  ? SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () {
                                        signInWithGoogle();
                                      },
                                      child: Image.asset(
                                        'assets/images/google_icon.webp',
                                      ),
                                    ),
                                  )
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ],
                    ),
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
