import 'package:farm_app/src/core/user/user_global.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  UserGlobal userGlobal = GetIt.I.get<UserGlobal>();

  setup() async {
    await Future.delayed(const Duration(seconds: 3));
    userGlobal.getUser(context);
  }

  @override
  void initState() {
    setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset:
                            const Offset(2, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(10),
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/ecology.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Kisaan",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}
