import 'package:farm_app/src/core/user/user_global.dart';
import 'package:farm_app/src/features/autentication/presenter/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class RegisterFarm extends StatefulWidget {
  const RegisterFarm({Key? key}) : super(key: key);

  @override
  State<RegisterFarm> createState() => _RegisterFarmState();
}

class _RegisterFarmState extends State<RegisterFarm> {
  int screen = 1;
  AuthGlobal auth = GetIt.I<AuthGlobal>();
  UserGlobal userGlobal = GetIt.I<UserGlobal>();
  TextEditingController farmName = TextEditingController();
  TextEditingController userName = TextEditingController();
  ScrollController scrollController = ScrollController();
  FocusNode focus = FocusNode();
  Planos plano = Planos.standard;
  int selected = 1;
  bool errorFarmName = false;
  bool errorName = false;

  nextStep() {
    switch (screen) {
      case 1:
        farmName.value.text.length >= 4
            ? setState(() {
                screen = 2;
                errorFarmName = false;
              })
            : setState(() {
                errorFarmName = true;
              });

        break;
      case 2:
        userName.value.text.length >= 8
            ? setState(() {
                screen = 3;
                errorName = false;
              })
            : setState(() {
                errorName = true;
              });

        break;
      case 3:
        setState(() {
          screen = 4;
        });

        break;

      default:
    }
  }

  backStep() {
    setState(() {
      if (screen > 0) screen = screen - 1;
    });
  }

  choosePlan(Planos newplano) {
    setState(() {
      plano = newplano;
    });
    nextStep();
  }

  bottomScroll() {
    scrollController.animateTo(900.0,
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget screen1() {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset("./assets/lottie12.json", height: size.height * 0.6),
            SizedBox(
              width: size.width * 0.80,
              height: size.height * 0.18,
              child: Column(
                children: const [
                  Text(
                    "Nome da Fazenda",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Insira o nome da sua fazenda, lembrando que poderá adicionar novas farms após o primeiro cadastro.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black26),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.9,
              height: size.height * 0.1,
              child: TextField(
                  controller: farmName,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    errorBorder: errorFarmName
                        ? const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))
                        : null,
                    errorText: errorFarmName
                        ? 'Nome da fazenda inválido, insira um válido.'
                        : '',
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusColor: Colors.red,
                    floatingLabelStyle: const TextStyle(color: Colors.black26),
                    label: Text("Nome da fazenda",
                        style: errorFarmName
                            ? const TextStyle(color: Colors.red)
                            : null),
                  )),
            ),
          ],
        ),
      );
    }

    Widget screen2() {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset("./assets/lottie13.json", height: size.height * 0.6),
            SizedBox(
              width: size.width * 0.80,
              height: size.height * 0.18,
              child: Column(
                children: const [
                  Text(
                    "Nome completo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Insira seu nome completo, vamos proporcionar a melhor experiência.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black26),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.9,
              height: size.height * 0.1,
              child: TextField(
                controller: userName,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    errorBorder: errorName
                        ? const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))
                        : null,
                    errorText:
                        errorName ? 'Nome inválido, insira um válido.' : '',
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusColor: Colors.red,
                    floatingLabelStyle: const TextStyle(color: Colors.black26),
                    label: Text("Nome completo",
                        style: errorName
                            ? const TextStyle(color: Colors.red)
                            : null)),
              ),
            ),
          ],
        ),
      );
    }

    Widget screen3() {
      return Container(
        color: Theme.of(context).primaryColor,
        height: size.height,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("STANDARD",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.attach_money,
                            size: 45,
                            color: Colors.white,
                          ),
                          Text("FREE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 90,
                                  fontWeight: FontWeight.w700)),
                          Text(
                            '/mês',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  title: const Text('FAZENDAS',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.home,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'quantidade de fazendas que podem ser cadastradas.',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                  trailing: const Text('2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  title: const Text(
                                    'FUNCIONÁRIOS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'quantidade de funcionários que podem ser cadastrados.',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                  trailing: const Text('3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  title: const Text(
                                    'EQUIPAMENTOS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.agriculture_rounded,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'quantidade de equipamentos que podem ser cadastrados.',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                  trailing: const Text('10',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  title: const Text(
                                    'ANIMAIS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.cast_connected_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'quantidade de animais que podem ser cadastrados.',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                  trailing: const Text('50',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: SizedBox(
                              width: size.width * 0.9,
                              height: size.height * 0.1,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: const Text(
                                  "SELECIONAR",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                onPressed: () {
                                  choosePlan(Planos.standard);
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  bottomScroll();
                                },
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 90,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("PREMIUM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.attach_money,
                            size: 45,
                            color: Colors.white,
                          ),
                          Text("400",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 90,
                                  fontWeight: FontWeight.w700)),
                          Text(
                            '/mês',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  title: const Text('FAZENDAS',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.home,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'quantidade de fazendas que podem ser cadastradas.',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                  trailing: const Text('4',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  title: const Text(
                                    'FUNCIONÁRIOS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'quantidade de funcionários que podem ser cadastrados.',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                  trailing: const Text('6',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  title: const Text(
                                    'EQUIPAMENTOS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.agriculture_rounded,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'quantidade de equipamentos que podem ser cadastrados.',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                  trailing: const Text('20',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  title: const Text(
                                    'ANIMAIS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.cast_connected_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'quantidade de animais que podem ser cadastrados.',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                  trailing: const Text('100',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: SizedBox(
                              width: size.width * 0.9,
                              height: size.height * 0.1,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: const Text(
                                  "SELECIONAR",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                onPressed: () {
                                  choosePlan(Planos.premium);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget screen4() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset("./assets/lottie1.json", height: size.height * 0.6),
          SizedBox(
            width: size.width * 0.90,
            height: size.height * 0.18,
            child: Column(
              children: const [
                Text(
                  "Parabéns, seja bem-vindo ao FarmApp",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Colocando sua Farm em outro nível",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black26),
                ),
              ],
            ),
          ),
          SizedBox(
              width: size.width * 0.9,
              height: size.height * 0.1,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Observer(builder: (context) {
                  return userGlobal.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Começar",
                          style: TextStyle(fontSize: 18),
                        );
                }),
                onPressed: () {
                  auth.newUsuario(context,
                      name: userName.value.text.trim(),
                      farmName: farmName.value.text.trim(),
                      plano: plano.toString());
                },
              )),
        ],
      );
    }

    Widget body() {
      switch (screen) {
        case 1:
          return screen1();

        case 2:
          return screen2();

        case 3:
          return screen3();
        case 4:
          return screen4();

        default:
          return const Scaffold(
            body: Center(
              child: Text("Erro inesperado!"),
            ),
          );
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Container(
              color:
                  screen == 3 ? Theme.of(context).primaryColor : Colors.white,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  screen > 1
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              backStep();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color:
                                  screen == 3 ? Colors.white30 : Colors.black12,
                              size: 40,
                            ),
                          ),
                        )
                      : Container(),
                  screen <= 3 && screen != 3
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              nextStep();
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color:
                                  screen == 3 ? Colors.white : Colors.black38,
                              size: 40,
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(child: body())));
  }
}

enum Planos { standard, premium }
