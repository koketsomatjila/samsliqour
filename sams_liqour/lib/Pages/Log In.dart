import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:sams_liqour/Pages/Home.dart';
import 'package:sams_liqour/Pages/Sign%20Up.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final _formKey = GlobalKey<FormState>();
TextEditingController _emailTextController = TextEditingController();
TextEditingController _passwordTextController = TextEditingController();

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);
    assert(user.photoURL == currentUser.photoURL);
    assert(user.displayName == currentUser.displayName);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }
  return null;
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  Fluttertoast.showToast(msg: "Login failed");
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool hidePass = true;
  void _toggle() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        flexibleSpace: Image(
          color: Colors.deepOrange.withOpacity(0.1),
          colorBlendMode: BlendMode.darken,
          image: AssetImage(
            'images/sams logo.jpg',
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
      body: Stack(
        children: [
          Image.asset('images/bar2.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              color: Colors.deepOrange.withOpacity(0.9),
              colorBlendMode: BlendMode.multiply),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 8.0),
                      //   child: Container(
                      //       alignment: Alignment.center, child: Text("Log In")),
                      // ),

                      //email field

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                            child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: ("Enter E-mail"),
                                  icon: Icon(Icons.email),
                                  border: InputBorder.none,
                                  labelText: "Email *",
                                ),
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return "Invalid Email";
                                    else
                                      return null;
                                  }
                                }),
                          ),
                        ),
                      ),

                      //password field

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.3,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 1, 1, 1),
                              child: ListTile(
                                title: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: ("Enter Password"),
                                      icon: Icon(Icons.lock_rounded),
                                      labelText: "Password *",
                                      border: InputBorder.none),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: hidePass,
                                  obscuringCharacter: "*",
                                  controller: _passwordTextController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Password field can't be empty";
                                    } else if (value.length < 6) {
                                      return "Password needs to be atleast 6 characters long";
                                    } else if (_passwordTextController.text !=
                                        value) {
                                      return "Incorrect password ";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye_rounded,
                                  ),
                                  onPressed: () {
                                    _toggle();
                                  },
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8.0, left: 8, right: 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue[800],
                          elevation: 0.3,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Log In",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            ' Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 62),
                            child: Text("Don't have an account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              ' Click here to sign up',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(),

                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 60.0),
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            child: _signInButton()),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 8.0),
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            child: _facebookSignInButton()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width,
      color: Colors.red[900],
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google logo.png"), height: 25.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _facebookSignInButton() {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width,
      color: Colors.red[900],
      splashColor: Colors.grey,
      onPressed: () {
        // TODO
        // signInWithGoogle().then((result) {
        //   if (result != null) {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) {
        //           return HomePage();
        //         },
        //       ),
        //     );
        //   }
        // });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/facebook.png"), height: 25.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Facebook',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
