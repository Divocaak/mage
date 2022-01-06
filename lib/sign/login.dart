import 'package:flutter/material.dart';
import 'package:mage/objects/player.dart';
import 'package:mage/pages/homepage.dart';
import 'package:mage/remote/sign.dart';
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

            Future<Map<String, dynamic>?> response =
                RemoteSign.login(usrname.getValue(), pass.getValue());
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: FutureBuilder<Map<String, dynamic>?>(
                    future: response,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!["code"] == "s") {
                          Future.delayed(Duration.zero, () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage(
                                    player: Player.fromJson(
                                        snapshot.data!["response"]))));
                          });
                        } else {
                          Future.delayed(
                              Duration.zero, () async => setState(() {}));
                          return Text(snapshot.data!["response"]);
                        }
                      } else if (snapshot.hasError) {
                        return const Text(
                            "Někde se stala chyba, zkuste to později.");
                      }

                      return const Center(child: CircularProgressIndicator());
                    })));
          },
          child: const Text("Login")),
      TextButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignRegister())),
          child: const Text("Register"))
    ])));
  }
}
