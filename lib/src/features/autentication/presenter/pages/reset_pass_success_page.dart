import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResetPassSuccess extends StatefulWidget {
  const ResetPassSuccess({Key? key}) : super(key: key);

  @override
  State<ResetPassSuccess> createState() => _ResetPassSuccess();
}

class _ResetPassSuccess extends State<ResetPassSuccess> {
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
                Lottie.asset('assets/lottie17.json'),
                SizedBox(
                  width: size.width * 0.9,
                  child: Column(
                    children: const [
                      Text(
                        "Verifique seu email",
                        style: TextStyle(fontSize: 24),
                      ),
                      Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          "Enviamos uma nova senha e instruções para o seu email.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.black26),
                        ),
                      ),
                    ],
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
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: const Text(
                      "Ok",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
