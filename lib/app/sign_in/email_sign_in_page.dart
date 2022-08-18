import 'package:flutter/material.dart';

import '../services/auth.dart';
import 'email_sign_in_form.dart';

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 3.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: EmailSignInForm(auth: auth),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
