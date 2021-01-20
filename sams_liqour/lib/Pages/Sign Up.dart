import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sams_liqour/Pages/Home.dart';
import 'package:sams_liqour/Pages/Log%20In.dart';
import '../Database/Users.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  UserCredential displayName;
  Map value;

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
                      //name field

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: ("Enter Full Nmae"),
                                    icon: Icon(Icons.person_add_alt_1_rounded),
                                    border: InputBorder.none,
                                    labelText: "Name *"),
                                keyboardType: TextInputType.name,
                                controller: _nameTextController,
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Name field can't be empty";
                                  } else
                                    return null;
                                }),
                          ),
                        ),
                      ),

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
                              decoration: InputDecoration(
                                  hintText: ("Enter E-mail"),
                                  icon: Icon(Icons.email),
                                  border: InputBorder.none,
                                  labelText: "Email *"),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextController,
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return "Invalid Email";

                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),

                      //password field

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, bottom: 2, right: 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 1, 1, 1),
                            child: ListTile(
                              title: TextFormField(
                                decoration: InputDecoration(
                                    hintText: ("Enter Password"),
                                    icon: Icon(Icons.lock_rounded),
                                    labelText: "Password *",
                                    border: InputBorder.none),
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordTextController,
                                obscureText: hidePass,
                                obscuringCharacter: '*',
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
                            ),
                          ),
                        ),
                      ),

                      //confirm password field

                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8.0, right: 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: ("Confirm Password"),
                                  icon: Icon(Icons.lock_rounded),
                                  labelText: "Confirm Password *",
                                  border: InputBorder.none),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              obscuringCharacter: "*",
                              controller: _confirmPasswordController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Password field can't be empty";
                                } else if (value.length < 6) {
                                  return "Password needs to be atleast 6 characters long";
                                } else if (_confirmPasswordController.text !=
                                    value) {
                                  return "Passwords don't match";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 38, bottom: 8.0, left: 8, right: 8),
                        child: Material(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue[800],
                          elevation: 0.3,
                          child: MaterialButton(
                            onPressed: () async {
                              validateForm();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 102),
                            child: Text("Already have an account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogIn(),
                                ),
                              );
                            },
                            child: Text(
                              ' Log In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(),
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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      formState.reset();
      User user = _auth.currentUser;
      if (user != null) {
        _auth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then((user) => {
                  _userServices.createUser(user.user.uid.toString(), {
                    "username": _nameTextController.text,
                    "email": user.user.email,
                    "userId": user.user.uid,
                  })
                })
            .catchError((err) => {print(err.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }
}
