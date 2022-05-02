import 'package:farm_app/src/core/user/user_global.dart';
import 'package:farm_app/src/features/autentication/presenter/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController resetController = TextEditingController();
  AuthGlobal auth = GetIt.I<AuthGlobal>();
  UserGlobal userGlobal = GetIt.I<UserGlobal>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Lottie.asset('assets/lottie16.json'),
                SizedBox(
                  width: size.width * 0.9,
                  child: Column(
                    children: const [
                      Text(
                        "Esqueceu sua senha?",
                        style: TextStyle(fontSize: 24),
                      ),
                      Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          "Insira seu email abaixo para receber uma nova senha de acesso.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.black26),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: InputBorder.none,
                          prefixIcon: const Icon(Icons.vpn_key_rounded),
                          label: const Text("Email"),
                          border: InputBorder.none,
                        ),
                        controller: resetController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: size.width * 0.9,
                      child: TextButton(
                        onPressed: () async {
                          auth.resetPassword(context,
                              userEmail: resetController.value.text.trim());
                        },
                        child: Observer(builder: (context) {
                          return userGlobal.isLoading
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
                                  "Send",
                                  style: TextStyle(color: Colors.white),
                                );
                        }),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
