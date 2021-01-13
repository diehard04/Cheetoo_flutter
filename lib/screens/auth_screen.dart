import 'dart:io';
import 'package:cheetoo/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String pwd,
    String userName,
    File image,
    bool isLogeIn,
    BuildContext ctx,
  ) async {
    AuthResult authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogeIn) {
        authResult =
            await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: pwd);
      }

      //....
      FirebaseStorage.instance.ref()

      await Firestore.instance
          .collection('users')
          .document(authResult.user.uid)
          .setData({'userName': userName, 'email': email});
    } on PlatformException catch (err) {
      var message = 'An error occurred, please check credentials!';
      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        _submitAuthForm,
        _isLoading,
      ),
    );
  }
}
