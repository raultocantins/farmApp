import 'package:flutter/material.dart';

class FinancialServicePage extends StatefulWidget {
  const FinancialServicePage({Key? key}) : super(key: key);

  @override
  _FinancialServicePageState createState() => _FinancialServicePageState();
}

class _FinancialServicePageState extends State<FinancialServicePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Set this height
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(2, 3), // changes position of shadow
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/saving.png",
                        height: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Financial Services",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.notification_add_rounded,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                height: size.height * 0.45,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColorDark
                                      .withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(
                                      2, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          height: 90,
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  width: 80,
                                  height: 90,
                                  child: const Icon(Icons.monetization_on,
                                      color: Colors.white, size: 50)),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "FAZENDA POR DO SOL 1",
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Zona rural de bandeirantes do tocantins - TO",
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    height: 10,
                                    width: 90,
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColorDark
                                      .withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(
                                      2, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          height: 90,
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  width: 80,
                                  height: 90,
                                  child: const Icon(Icons.monetization_on,
                                      color: Colors.white, size: 50)),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "FAZENDA POR DO SOL 2",
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Zona rural de bandeirantes do tocantins - TO",
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    height: 10,
                                    width: 180,
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: const Center(
                    child: Text("lista de notificacoes das fazendas",
                        style: TextStyle(color: Colors.white, fontSize: 20))))
          ],
        ),
      ),
    );
  }
}
