import 'package:flutter/material.dart';

class LogOrSign extends StatefulWidget {
  final bool isSigned;
  const LogOrSign({super.key, required this.isSigned});

  @override
  State<LogOrSign> createState() => _LogOrSignState();
}

class _LogOrSignState extends State<LogOrSign> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
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
                        'Log In',
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
                                onPressed: () {},

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
                                child: Text('Log In'),
                              ),
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
