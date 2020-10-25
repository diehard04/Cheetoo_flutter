import 'package:cheetoo/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
      String email, String pwd, String userName, bool isLogeIn, BuildContext ctx,) async {

    AuthResult authResult;
    try {
      if (isLogeIn) {
        authResult =
            await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: pwd);
      }
    } on PlatformException catch (err) {
      var message = 'An error occured, please check credentials!';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm,),
    );
  }
}
