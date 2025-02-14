import 'dart:io';

import 'package:cheetoo/widgets/auth/user_image_picker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
      String email,
      String pwd,
      String userName,
      File image,
      bool isLogIn,
      BuildContext ctx,
      ) submitFn;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthFormState();
  }
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus(); // hide key board

    if (_userImageFile != null && !_isLogin) {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Please pick an image'),
          backgroundColor: Theme.of(context).errorColor,
          )
      );
    return;
    }
    if (isValid) {
    _formKey.currentState.save();
    // print(_userEmail);
    // print(_userName);
    // print(_userPassword);
    // use those value to auth request ...
    widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
    _userImageFile, _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (!_isLogin) UserImagePicker(_pickedImage),
                    TextFormField(
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                      ),
                      onSaved: (value) {
                        _userEmail = value;
                      },
                    ),
                    if (!_isLogin)
                      TextFormField(
                        key: ValueKey('username'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 4) {
                            return 'Please enter at least 4 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'User Name'),
                        onSaved: (value) {
                          _userName = value;
                        },
                      ),
                    TextFormField(
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 7) {
                          return 'Password must me 7 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      onSaved: (value) {
                        _userPassword = value;
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    if (widget.isLoading) CircularProgressIndicator(),
                    if (!widget.isLoading)
                      RaisedButton(
                        child: Text(_isLogin ? 'login' : 'Sign up'),
                        onPressed: _trySubmit,
                      ),
                    if (!widget.isLoading)
                      FlatButton(
                        child: Text(_isLogin
                            ? 'Create New Account'
                            : 'I already have an account'),
                        textColor: Theme
                            .of(context)
                            .primaryColor,
                        onPressed: () {
                          setState(() {
                            // save the UI state
                            _isLogin = !_isLogin;
                          });
                        },
                      )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
