import 'package:flutter/material.dart';
import 'package:mage/remote/sign.dart';
import 'package:mage/widgets/form_text.dart';

class SignRegister extends StatefulWidget {
  const SignRegister({Key? key}) : super(key: key);

  @override
  State<SignRegister> createState() => _SignRegisterState();
}

class _SignRegisterState extends State<SignRegister> {
  @override
  Widget build(BuildContext context) {
    FormText usrname =
        FormText(hint: "Username", maxLen: 20, icon: Icons.person);
    FormText pass =
        FormText(hint: "Password", obscure: true, icon: Icons.password);
    FormText passConf =
        FormText(hint: "Password confirm", obscure: true, icon: Icons.password);

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Form(key: _formKey, child: Column(children: [usrname, pass, passConf])),
      TextButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            _formKey.currentState?.save();

            if (pass.getValue() != passConf.getValue()) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Passwords do not match")));
              return;
            }

            Future<String?> response =
                RemoteSign.register(usrname.getValue(), pass.getValue());
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: FutureBuilder(
                    future: response,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Future.delayed(
                            Duration.zero, () async => setState(() {}));
                        return Text(snapshot.data.toString());
                      } else if (snapshot.hasError) {
                        return const Text(
                            "Někde se stala chyba, zkuste to později.");
                      }

                      return const Center(child: CircularProgressIndicator());
                    })));
          },
          child: const Text("Register")),
      TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Login"))
    ])));
  }
}
