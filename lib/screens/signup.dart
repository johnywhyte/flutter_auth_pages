import 'package:flutter/material.dart';
import 'package:my_ecommerce/screens/login.dart';

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
                              fontSize: 30, fontWeight: FontWeight.bold))
                    ])),
            SizedBox(height: 20),
            Container(
                height: 420,
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return 'Username is Required';
                          } else if (value.length < 6) {
                            return 'Username is too short';
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                            hintText: 'UserName',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return 'email is required';
                          } else if (!regExp.hasMatch(value)) {
                            return 'email is invalid';
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return 'Phone Number is Required';
                          } else if (value.length < 11) {
                            return 'Invalid Phone Number';
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        obscureText: obserText,
                        validator: (value) {
                          if (value == "") {
                            return 'Password is Required';
                          } else if (value.length < 8) {
                            return 'Password is too short';
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child:
                             Icon(obserText==true ?  Icons.visibility : Icons.visibility_off, 
                             color: Colors.black),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: RaisedButton(
                            child: Text('Register',
                                style: TextStyle(color: Colors.white)),
                            color: Colors.blue[800],
                            onPressed: () {
                              validation();
                            }),
                      ),
                      Row(
                        children: [
                          Text('I aleady Have An Account'),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                            Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => Login()
                          ),
                          );
                          },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.blue[400],
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ]))
          ],
        )),
      ),
    );
  }
}
