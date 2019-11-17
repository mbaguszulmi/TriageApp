import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'mainApp.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _passwordHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFF0F5FF),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/svg/login_top.svg',
                    semanticsLabel: 'BG Top',
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                    width: MediaQuery.of(context).size.width*0.86
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.86,
                    padding: EdgeInsets.only(top: 50, bottom: 50, right: 30, left: 30),

                    child: Text(
                      widget.title.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 30
                      ),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset(
                'assets/svg/login_bottom.svg',
                semanticsLabel: 'BG Bottom',
                width: MediaQuery.of(context).size.width
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 20, top: 20),
              child: SvgPicture.asset(
                'assets/svg/dokter.svg',
                semanticsLabel: 'Dokter BG',
                width: MediaQuery.of(context).size.width * 0.8
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 12.5,
                      offset: Offset(0, 20.0)
                    )
                  ]
                ),
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  // autovalidate: true,
                  
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          controller: _username,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please fill this field';
                            }
                            else if (value.trim().contains(' ')) {
                              return 'No space allowed';
                            }
                            return null;
                          },

                          keyboardType: TextInputType.text,

                          decoration: InputDecoration(
                            labelText: 'Username',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Color(0xFFB7B7B7)
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                          )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          controller: _password,
                          obscureText: _passwordHide,

                          validator: (value) {
                            if (value.length < 8) {
                              return 'Enter password at leaset 8 characters';
                            }
                            return null;
                          },

                          keyboardType: TextInputType.visiblePassword,
                          
                          decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Color(0xFFB7B7B7)
                              )
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_passwordHide ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _passwordHide = !_passwordHide;
                                });
                              },
                            )
                          )
                        ),
                      ),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        
                        child: RaisedButton(
                          color: Color(0xFF3F3D56),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainApp()));
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        )
                      )
                    ],
                  )
                ),
              )
            )
          ],
        ),
      )
    );
  }
}