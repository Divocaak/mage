import 'package:flutter/material.dart';
import 'package:mage/remote/sign.dart';
import 'package:mage/sign/auth_gate.dart';
import 'package:mage/sign/register.dart';
import 'package:mage/widgets/form_text.dart';

class SignLogin extends StatefulWidget {
  const SignLogin({Key? key}) : super(key: key);

  @override
  State<SignLogin> createState() => _SignLoginState();
}

class _SignLoginState extends State<SignLogin> {
  @override
  Widget build(BuildContext context) {
    FormText usrname =
        FormText(hint: "Username", maxLen: 20, icon: Icons.person);
    FormText pass =
        FormText(hint: "Password", obscure: true, icon: Icons.password);

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Form(key: _formKey, child: Column(children: [usrname, pass])),
      TextButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) {
              return;
            }

            _formKey.currentState?.save();

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AuthGate(
                    username: usrname.getValue(), password: pass.getValue())));
          },
          child: const Text("Login")),
      TextButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignRegister())),
          child: const Text("Register"))
    ])));
  }
}
