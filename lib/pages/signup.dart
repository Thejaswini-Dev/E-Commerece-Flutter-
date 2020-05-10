import 'package:fashionapp/commons/commons.dart';
import 'package:fashionapp/commons/loading.dart';
import 'package:fashionapp/db/auth.dart';
import 'package:fashionapp/db/users.dart';
import 'package:fashionapp/pages/home.dart';
import 'package:fashionapp/provider.dart/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
     final _key = GlobalKey<ScaffoldState>();
  UserServices _userServices = UserServices();
  TextEditingController _email = TextEditingController();
  TextEditingController _password= TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String gender;
  String groupValue = "male";
  bool loading = false;
  bool hidePass = true;
  bool isLogedIn = false;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
      final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating ? Loading() :
      
      Stack(children: <Widget>[
        Image.asset(
          "images/c1.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          color: Colors.black.withOpacity(0.2),
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
            child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.5),
                    child: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Full name ",
                              icon: Icon(Icons.person_outline),
                              border: InputBorder.none),
                          controller: _name,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The name field cannot be empty";
                            }
                            return null;
                          },
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.5),
                    child: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email ",
                              icon: Icon(Icons.alternate_email),
                              border: InputBorder.none),
                          keyboardType: TextInputType.emailAddress,
                          controller: _email,
                          validator: (value) {
                            if (value.isEmpty) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Please make sure your email address is valid';
                              else
                                return null;
                            }
                          },
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "male",
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Radio(
                                value: "male",
                                groupValue: groupValue,
                                onChanged: (e) => valueChanged(e)),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "female",
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Radio(
                                value: "female",
                                groupValue: groupValue,
                                onChanged: (e) => valueChanged(e)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.5),
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          obscureText: hidePass,
                          decoration: InputDecoration(
                              labelText: "Password",
                              icon: Icon(Icons.lock_outline),
                              border: InputBorder.none),
                          keyboardType: TextInputType.emailAddress,
                          controller: _password,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The password field cannot be empty";
                            } else if (value.length < 6) {
                              return "the password has to be least 6 characters long";
                            }
                            return null;
                          },
                        ),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePass = false;
                              });
                            }),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.5),
                    elevation: 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          obscureText: hidePass,
                          decoration: InputDecoration(
                              labelText: "Confirm Password",
                              icon: Icon(Icons.lock_outline),
                              border: InputBorder.none),
                          // keyboardType: TextInputType.emailAddress,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The password field cannot be empty";
                            } else if (value.length < 6) {
                              return "the password has to be least 6 characters long";
                            } else if (_password.text != value) {
                              return "the password do not match";
                            }
                            return null;
                          },
                        ),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePass = false;
                              });
                            }),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red,
                    child: MaterialButton(
                       onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          if (!await user.signUp(_name.text,_email.text, _password.text))
                            _key.currentState.showSnackBar(SnackBar(
                              content: Text("Sign in failed"),
                            ));
                        }
                      },
                      minWidth: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("I already have an account",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: deepOrange, fontSize: 16.0)))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                         child: Text("or sign up with", style: TextStyle(color:Colors.white.withOpacity(1.0)),)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            child: MaterialButton(
                          child: Image.asset(
                            "images/c1.jpeg",
                          ),
                          onPressed: () async {
                            FirebaseUser user = await auth.googleSignIn();
                            if (user == null) {
                              _userServices.createUser({
                                "name": user.displayName,
                                "photo": user.photoUrl,
                                "email": user.email,
                                "userId": user.uid
                              });

                              changeScreenReplacement(context, HomePage());
                            }
                          },
                        )),
                      ),
                    ])
              ]),
        )),
        Visibility(
          visible: loading ?? true,
          child: Center(
            child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red))),
          ),
        ),
      ]),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        groupValue = e;
      }
    });
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      Map value;

      // if (user == null) {
      //   await firebaseAuth
      //       .createUserWithEmailAndPassword(
      //           email: _emailTextController.text,
      //           password: _passwordTextController.text)
      //       .then(
      //         (user) => {
      //           _userServices.createUser(
      //             user.user.uid.toString(),
      //             {
      //               "username": user.user..displayName,
      //               "email": user.user.email,
      //               "userId": user.user.uid,
      //               "gender": gender,
      //             },
      //           ),
      //         },
      //       )
      //       .catchError((err) => {print(err.toString())});
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => HomePage()));
      // }
    }
  }
}
