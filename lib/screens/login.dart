import 'package:flutter/material.dart';
import 'package:my_ecommerce/screens/signup.dart';
import 'package:my_ecommerce/widgets/changescreen.dart';
import 'package:my_ecommerce/widgets/mytextformfield.dart';
import 'package:my_ecommerce/widgets/passwordtextformfield.dart';
import '../widgets/mybutton.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

void validation() {
  final FormState _form = _formKey.currentState;
  if (_form.validate()) {
    print('yes');
  } else {
    print('no');
  }
}

class _LoginState extends State<Login> {
  Widget _buildAllParts() {
    return Container(
      height: 350,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Login',
            style: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          MyTextFormField(
            name: 'email',
            validator: (value) {
              if (value == "") {
                return 'email is required';
              } else if (!regExp.hasMatch(value)) {
                return 'email is invalid';
              }
              return "";
            },
          ),
          PasswordTextFormField(
            obserText: obserText,
            name: 'Password',
            validator: (value) {
              if (value == "") {
                return 'Password is Required';
              } else if (value.length < 8) {
                return 'Password is too short';
              }
              return "";
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),

          //////Button
          MyButton(
            onPressed: () {
              validation();
            },
            name: "Login",
          ),

          ChangeScreen(
            name: "SignUp",
            whichAccount: "I don't have an account",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => SignUp()),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAllParts()
            ],
          ),
        ),
      ),
    );
  }
}
