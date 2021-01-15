import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:sams_liqour/Pages/Home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();
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

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }
  return null;
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  Fluttertoast.showToast(msg: "Login failed");
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        flexibleSpace: Image(
          image: AssetImage('images/sams logo.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
      body: Stack(
        children: [
          Image.asset('images/bar2.jpg',
              fit: BoxFit.fitHeight,
              height: double.infinity,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken),
          Padding(
            padding: const EdgeInsets.only(bottom: 88.0),
            child:
                Container(alignment: Alignment.center, child: _signInButton()),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Container(
                alignment: Alignment.center, child: _facebookSignInButton()),
          ),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return FlatButton(
      color: Colors.red.withOpacity(0.85),
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
        padding: const EdgeInsets.fromLTRB(26, 10, 26, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google logo.png"), height: 35.0),
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
      color: Colors.red.withOpacity(0.85),
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
            Image(image: AssetImage("images/facebook.png"), height: 35.0),
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
