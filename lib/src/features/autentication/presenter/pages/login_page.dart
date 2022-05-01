import 'package:farm_app/src/core/user/user_global.dart';
import 'package:farm_app/src/features/autentication/presenter/controllers/auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthGlobal auth = GetIt.I<AuthGlobal>();
  UserGlobal userGlobal = GetIt.I<UserGlobal>();
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

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
                        child: Lottie.asset("./assets/lottie2.json",
                            height: size.height * 0.3,
                            width: size.width,
                            fit: BoxFit.contain),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text("Signin in Your Account",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context).primaryColorDark,
                                  fontWeight: FontWeight.w100))),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: Form(
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
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                focusedBorder: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.person,
                                ),
                                border: InputBorder.none,
                                focusColor: Colors.red,
                                floatingLabelStyle:
                                    const TextStyle(color: Colors.black26),
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
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              focusedBorder: InputBorder.none,
                              prefixIcon: const Icon(Icons.vpn_key_rounded),
                              label: const Text("Password"),
                              border: InputBorder.none,
                            ),
                            controller: password,
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
                                        .pushNamed('/resetpassword');
                                  },
                                  child: const Text(
                                    "Esqueceu a senha?",
                                    style: TextStyle(color: Color(0XFF25C586)),
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
                              await auth.loginUser(context,
                                  email: email.text, password: password.text);
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
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: size.width * 0.4,
                                child: const Divider(
                                  color: Colors.grey,
                                  height: 50,
                                ),
                              ),
                              const Text("OU"),
                              SizedBox(
                                width: size.width * 0.4,
                                child: const Divider(
                                  color: Colors.grey,
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          width: size.width * 0.9,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/register");
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(color: Color(0XFF25C586)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
