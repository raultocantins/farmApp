import 'package:email_validator/email_validator.dart';
import 'package:farm_app/src/core/user/user_global.dart';
import 'package:farm_app/src/features/autentication/presenter/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthGlobal auth = GetIt.I<AuthGlobal>();
  UserGlobal userGlobal = GetIt.I<UserGlobal>();
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Observer(builder: (context) {
        return Scaffold(
            body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.5,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Lottie.asset("./assets/lottie5.json",
                            height: size.height * 0.3,
                            width: size.width,
                            fit: BoxFit.contain),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: Text("Create Your Account",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context).primaryColorDark,
                                  fontWeight: FontWeight.w100))),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                focusedBorder: InputBorder.none,
                                prefixIcon: const Icon(Icons.person),
                                label: const Text("Email")),
                            controller: email,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                focusedBorder: InputBorder.none,
                                prefixIcon: const Icon(Icons.vpn_key_rounded),
                                label: const Text("Password")),
                            controller: password,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                focusedBorder: InputBorder.none,
                                prefixIcon: const Icon(Icons.vpn_key_rounded),
                                label: const Text("Confirm Password")),
                            controller: confirmpassword,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed("/login");
                                  },
                                  child: Text(
                                    "Já é usuário?",
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          width: size.width * 0.9,
                          child: TextButton(
                            onPressed: () async {
                              userGlobal.changeLoading(true);

                              if (EmailValidator.validate(email.value.text) &&
                                  password.value.text ==
                                      confirmpassword.value.text) {
                                try {
                                  await auth.registerUser(context,
                                      email: email.text,
                                      password: password.text);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())),
                                  );
                                }
                              } else if (EmailValidator.validate(
                                      email.value.text) ==
                                  false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Email incorreto, por favor insira um correto!')),
                                );
                                userGlobal.changeLoading(false);
                              } else if (password.value.text !=
                                  confirmpassword.value.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Senhas não conferem!')),
                                );
                                userGlobal.changeLoading(false);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Valores incorretos, revise e tente novamente!')),
                                );
                                userGlobal.changeLoading(false);
                              }
                            },
                            child: userGlobal.isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : const Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
      }),
    );
  }
}
