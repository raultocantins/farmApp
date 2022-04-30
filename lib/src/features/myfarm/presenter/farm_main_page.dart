import 'package:flutter/material.dart';

class FarmMainPage extends StatefulWidget {
  const FarmMainPage({Key? key}) : super(key: key);

  @override
  _FarmMainPageState createState() => _FarmMainPageState();
}

class _FarmMainPageState extends State<FarmMainPage> {
  int index = 0;

  selectItem(int i) {
    setState(() {
      index = i;
    });
  }

  Widget body(int i) {
    switch (i) {
      case 0:
        return Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text("Resumo completo",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))
                    ],
                  ),
                  const SizedBox(height: 0),
                  const ListemItemCustom(
                    title: "Total",
                    subtitle: "quantidade total de animais",
                    total: 3000,
                    value: 3000,
                  ),
                  const ListemItemCustom(
                    title: "Vaca",
                    subtitle: "espaço ou pasto",
                    total: 3000,
                    value: 500,
                  ),
                  const ListemItemCustom(
                    title: "Boi",
                    subtitle: "espaço ou pasto",
                    total: 3000,
                    value: 1000,
                  ),
                  const ListemItemCustom(
                    title: "Vaca",
                    subtitle: "espaço ou pasto",
                    total: 3000,
                    value: 600,
                  ),
                  const ListemItemCustom(
                    title: "Bezerro",
                    subtitle: "espaço ou pasto",
                    total: 3000,
                    value: 50,
                  ),
                  const ListemItemCustom(
                    title: "Bezerro",
                    subtitle: "espaço ou pasto",
                    total: 3000,
                    value: 150,
                  ),
                  const ListemItemCustom(
                    title: "Vaca de cria ",
                    subtitle: "espaço ou pasto",
                    total: 3000,
                    value: 700,
                  ),
                ],
              ),
            )
          ],
        );

      case 1:
        return Container();

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset:
                            const Offset(2, 3), // changes position of shadow
                      ),
                    ]),
                height: size.height * 0.4,
                width: size.width,
              ),
              Positioned(
                top: 45,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Icon(Icons.arrow_back,
                          color: Theme.of(context).primaryColor)),
                ),
              ),
              Positioned(
                bottom: 10,
                child: SizedBox(
                  width: size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              selectItem(0);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      index == 0
                                          ? BoxShadow(
                                              color: Theme.of(context)
                                                  .backgroundColor
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 5,
                                              offset: const Offset(0,
                                                  0), // changes position of shadow
                                            )
                                          : const BoxShadow()
                                    ],
                                    color: index == 0
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50))),
                                width: index == 0 ? 80 : 70,
                                height: index == 0 ? 80 : 70,
                                child: Center(
                                    child: Image.asset("assets/cow.png",
                                        height: 40))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              selectItem(1);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      index == 1
                                          ? BoxShadow(
                                              color: Theme.of(context)
                                                  .backgroundColor
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 5,
                                              offset: const Offset(0,
                                                  0), // changes position of shadow
                                            )
                                          : const BoxShadow()
                                    ],
                                    color: index == 1
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50))),
                                width: index == 1 ? 80 : 70,
                                height: index == 1 ? 80 : 70,
                                child: Center(
                                    child: Image.asset("assets/horse.png",
                                        height: 40))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              selectItem(2);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      index == 2
                                          ? BoxShadow(
                                              color: Theme.of(context)
                                                  .backgroundColor
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 5,
                                              offset: const Offset(0,
                                                  0), // changes position of shadow
                                            )
                                          : const BoxShadow()
                                    ],
                                    color: index == 2
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50))),
                                width: index == 2 ? 80 : 70,
                                height: index == 2 ? 80 : 70,
                                child: Center(
                                    child: Image.asset("assets/chicken.png",
                                        height: 40))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              selectItem(3);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      index == 3
                                          ? BoxShadow(
                                              color: Theme.of(context)
                                                  .backgroundColor
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 5,
                                              offset: const Offset(0,
                                                  0), // changes position of shadow
                                            )
                                          : const BoxShadow()
                                    ],
                                    color: index == 3
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50))),
                                width: index == 3 ? 80 : 70,
                                height: index == 3 ? 80 : 70,
                                child: Center(
                                    child: Image.asset("assets/pig.png",
                                        height: 40))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              selectItem(4);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      index == 4
                                          ? BoxShadow(
                                              color: Theme.of(context)
                                                  .backgroundColor
                                                  .withOpacity(0.3),
                                              spreadRadius: 5,
                                              blurRadius: 5,
                                              offset: const Offset(0,
                                                  0), // changes position of shadow
                                            )
                                          : const BoxShadow()
                                    ],
                                    color: index == 4
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50))),
                                width: index == 4 ? 80 : 70,
                                height: index == 4 ? 80 : 70,
                                child: Center(
                                    child: Image.asset("assets/grass.png",
                                        height: 40))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //Colocar condicao index para trocar de container
          SizedBox(
            height: size.height * 0.57,
            width: size.width,
            child: body(index),
          )
        ],
      ),
    );
  }
}

class ListemItemCustom extends StatelessWidget {
  const ListemItemCustom(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.total})
      : super(key: key);
  final String title;
  final String subtitle;
  final int value;
  final int total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.catching_pokemon,
                    size: 30, color: Theme.of(context).primaryColorLight),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value.toString(),
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).primaryColor)),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(17),
                      bottomRight: Radius.circular(17)),
                ),
                width: 350 * (value / total),
                height: 10,
              )
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
