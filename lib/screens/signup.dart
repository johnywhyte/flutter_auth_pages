import 'package:flutter/material.dart';
import 'package:my_ecommerce/screens/login.dart';
import 'package:my_ecommerce/widgets/passwordtextformfield.dart';
import '../widgets/mybutton.dart';
import '../widgets/changescreen.dart';
import '../widgets/mytextformfield.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class SignUpState extends State<SignUp> {
  void validation() {
    final FormState _form = _formKey.currentState;
    if (_form.validate()) {
      print('yes');
    } else {
      print('no');
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 360,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: 'Username',
            validator: (value) {
              if (value == "") {
                return 'Username is Required';
              } else if (value.length < 6) {
                return 'Username is too short';
              }
              return "";
            },
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
          MyTextFormField(
            name: 'Phone Number',
            validator: (value) {
              if (value == "") {
                return 'Phone Number is Required';
              } else if (value.length < 11) {
                return 'Invalid Phone Number';
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
        ],
      ),
    );
  }

  Widget _buildAllParts() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
              onPressed: () {
                validation();
              },
              name: "SignUp"),
                SizedBox(height: 15),
          ChangeScreen(
            name: "LogIn",
            whichAccount: "I already have an account",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => Login()),
              );
            },
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: _register());
  }

  Widget _register() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
                height: 150,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('Register',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold))
                    ])),
            SizedBox(height: 20),
            _buildAllParts()
          ],
        )),
      ),
    );
  }
}
