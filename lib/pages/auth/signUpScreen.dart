// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'loginScreen.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final TextEditingController _textEditingController = TextEditingController();

    @override
    void dispose() {
      _textEditingController.clear();
      super.dispose();
    }

    bool isEmailCorrect = false;
    final _username = GlobalKey<FormState>();
    final _email = GlobalKey<FormState>();
    final _password = GlobalKey<FormState>();
    bool _hidden = true;
    
    late String _pass;
    double _strength = 0;
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp letterReg = RegExp(r".*[A-Za-z].*");
    String _displayText = '';

    void _toggle() {
    setState(() {
      _hidden = !_hidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        centerTitle: true,

      ),

      body: Container(
        decoration: const BoxDecoration(
            // color: Colors.red.withOpacity(0.1),
            image: DecorationImage(
                image: NetworkImage(
                    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp2T_UoR8vXNZXfMhtxXPFvmDWmkUbVv3A40TYjcunag0pHFS_NMblOClDVvKLox4Atw&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7IBkCtYd6ulSfLfDL-aSF3rv6UfmWYxbSE823q36sPiQNVFFLatTFdGeUSnmJ4tUzlo&usqp=CAU'),
                fit: BoxFit.cover,
                opacity: 0.3)),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                      'assets/images/signup.json',
                      animate: true,
                      height: 150,
                      width: 630),
                  // logo here
                  // Image.asset(
                  //   'assets/images/logo_new.png',
                  //   height: 120,
                  //   width: 120,
                  // ),
                  Text(
                    'Sign Up Now',
                    style: GoogleFonts.indieFlower(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Text(
                    'Please sign up to use our app',
                    style: GoogleFonts.indieFlower(
                      textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w300,
                          // height: 1.5,
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //username
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Form(
                            key: _username,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.purple,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Username",
                                hintText: 'testing123',
                                labelStyle: TextStyle(color: Colors.purple),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a username';
                                }
                              },
                            ),
                          ),
                        ),

                        //email
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: Form(
                            key: _email,
                          child: TextFormField(
                            controller: _textEditingController,
                            onChanged: (val) {
                              setState(() {
                                isEmailCorrect = isEmail(val);
                              });
                            },
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.purple,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Email",
                              hintText: 'your-email@domain.com',
                              labelStyle: TextStyle(color: Colors.purple),
                              // suffixIcon: IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(Icons.close,
                              //         color: Colors.purple))
                            ),
                            validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter email!';
                                }
                                else if(!isEmailCorrect) {
                                  return 'Enter valid email';
                                }
                              },
                          ),
                        ),
                      ),

                        //Password
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Form(
                            key: _password,
                            child: TextFormField(
                              obscuringCharacter: '*',
                              obscureText: _hidden,
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.purple,
                                ),
                                suffixIcon: IconButton(icon: Icon(_hidden ? Icons.visibility : Icons.visibility_off),
                                onPressed: () => _toggle()),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Password",
                                hintText: '*********',
                                labelStyle: const TextStyle(color: Colors.purple),
                              ),
                              onChanged:(value) => {
                              if (value.isEmpty) {
                              setState(() {
                                _strength = 0;
                              })
                            } else if (value.length < 6) {
                              setState(() {
                                _strength = 1 / 4;
                                _displayText = 'Your password is too short';
                              })
                            } else if (value.length < 8) {
                              setState(() {
                                _strength = 2 / 4;
                                _displayText = 'Your password is acceptable but not strong';
                              })
                            } else {
                              if (!letterReg.hasMatch(value) || !numReg.hasMatch(value)) {
                                setState(() {
                                  // Password length >= 8
                                  // But doesn't contain both letter and digit characters
                                  _strength = 3 / 4;
                                  _displayText = 'Your password is strong';
                                })
                              } else {
                                // Password length >= 8
                                // Password contains both letter and digit characters
                                setState(() {
                                  _strength = 1;
                                  _displayText = 'Your password is great';
                                })
                                }}
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  _strength = 1/4;
                                  return 'Enter a valid password';
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LinearProgressIndicator(
                        value: _strength,
                        backgroundColor: Colors.grey[300],
                        color: _strength <= 1 / 4
                            ? Colors.red
                            : _strength == 2 / 4
                            ? Colors.yellow
                            : _strength == 3 / 4
                            ? Colors.blue
                            : Colors.green,
                        minHeight: 15,
                      ),
                      Text(
                        _displayText,
                        style: const TextStyle(fontSize: 18),
                      ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    // backgroundColor: isEmailCorrect == false
                                    //     ? Colors.red
                                    //     : Colors.purple,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 131, vertical: 20)
                                    // padding: EdgeInsets.only(
                                    //     left: 120, right: 120, top: 20, bottom: 20),
                                    ),
                                onPressed: () {
                                  if (_username.currentState!.validate() && _email.currentState!.validate() && _password.currentState!.validate() && isEmailCorrect) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Register Success!')),
                                    );
                                  Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const loginScreen()));
                                  }
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => loginScreen()));
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(fontSize: 17),
                                ))
                            , Container(),
                      ],
                    ),
                  ),

                  //this is button
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(10.0)),
                  //         backgroundColor: Colors.purple,
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: MediaQuery.of(context).size.width / 3.3,
                  //             vertical: 20)
                  //         // padding: EdgeInsets.only(
                  //         //     left: 120, right: 120, top: 20, bottom: 20),
                  //         ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => loginScreen()));
                  //     },
                  //     child: Text(
                  //       'Sounds Good!',
                  //       style: TextStyle(fontSize: 17),
                  //     )), //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const loginScreen()));
                        },
                        child: const Text(
                          'Log In',
                          
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w500),
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
