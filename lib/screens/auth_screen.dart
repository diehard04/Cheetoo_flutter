import 'package:cheetoo/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(),
    );
  }
}
