import 'package:farm_app/src/core/user/user_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class MainLogin extends StatefulWidget {
  const MainLogin({Key? key}) : super(key: key);

  @override
  _MainLoginState createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  UserGlobal userGlobal = GetIt.I<UserGlobal>();
  goToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed("/login");
  }

  goToRegister(BuildContext context) {
    Navigator.of(context).pushReplacementNamed("/register");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: SizedBox(
              height: 200,
              width: size.width * 0.9,
              child: Image.asset(
                "assets/harvest.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: size.width * 0.9,
                child: const Text.rich(TextSpan(
                    text: "Junte-se a nós\n",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "O controle de sua fazenda nas palmas das mãos com farmApp.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      )
                    ])),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: size.width * 0.9,
                child: TextButton(
                  onPressed: () {
                    goToLogin(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                width: size.width * 0.9,
                child: TextButton(
                  onPressed: () {
                    goToRegister(context);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
