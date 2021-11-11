import 'package:flutter/material.dart';
import 'package:app/src/pages/login/login_pages.dart';
import 'package:app/src/pages/login/signup_pages.dart';
import 'package:app/src/pages/login/google.dart';
import 'package:app/src/provider/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/src/provider/google_sign_in.dart';

class openlogin extends StatefulWidget {
  // const openlogin({Key? key}) : super(key: key);

  @override
  _openloginState createState() => _openloginState();
}

class _openloginState extends State<openlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft, end: Alignment.bottomRight,
              // colors: [Colors.deepOrange, Colors.amberAccent]),
              colors: [Colors.amberAccent, Colors.red]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // add Column
            children: <Widget>[
              Material(
                elevation: 4.0,
                shape: CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage('assets/imgIcon/shopping-bag.png'),
                  fit: BoxFit.cover,
                  width: 100.0,
                  height: 100.0,
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Shodee',
                  style: TextStyle(
                      // your text
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              // color: Colors.white)),
              SizedBox(
                height: 10, // <-- Your width
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: Text('เข้าสู่ระบบ'),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.white,
                  splashColor: Colors.blue,
                  textColor: Color(0xfffe67e22),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signup()),
                    );
                  },
                  child: Text('สร้างบัญชี'),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.white,
                  splashColor: Colors.blue,
                  textColor: Color(0xfffe67e22),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Text(
                    "OR",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ButtonTheme(
                minWidth: 250,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.login();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Image.asset(
                        'assets/imgIcon/google.png',
                        height: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('เข้าสู่ระบบด้วย Google')
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.white,
                  splashColor: Colors.blue,
                  textColor: Color(0xfffe67e22),
                ),
              ),
              GoogleSignupButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          buildSignUp(),
        ],
      );

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'Welcome Back To MyApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          GoogleSignupButtonWidget(),
          SizedBox(height: 12),
          Text(
            'Login to continue',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
        ],
      );
}

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlineButton(
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          highlightedBorderColor: Colors.black,
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ),
      );
}

class GoogleTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return LoggedInWidget();
              } else {
                return SignUpWidget();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      );
}
