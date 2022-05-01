import 'package:farm_app/src/core/user/user_global.dart';
import 'package:farm_app/src/features/autentication/presenter/controllers/auth.dart';

import 'package:farm_app/src/features/home/presenter/widgets/home_button_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthGlobal auth = GetIt.I<AuthGlobal>();
  UserGlobal userGlobal = GetIt.I<UserGlobal>();
  FirebaseAuth firebase = FirebaseAuth.instance;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  logout() async {
    try {
      await auth.logout();

      Navigator.of(context).pushReplacementNamed("/authentication");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
        ),
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    child: Image.asset(
                                      'assets/elon.jpeg',
                                      fit: BoxFit.cover,
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                height: size.height * 0.2,
                                width: size.width,
                                child: const Icon(
                                  Icons.photo_camera,
                                  color: Colors.white38,
                                  size: 25,
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          userGlobal.usuario!.name,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListTile(
                      title: const Text('Email'),
                      subtitle: Text(userGlobal.usuario!.email),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.email),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.edit),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListTile(
                      title: const Text('Plano'),
                      subtitle: Text(userGlobal.usuario!.plano),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.person),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.edit),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListTile(
                      title: const Text('Telefone'),
                      subtitle: const Text('63992086480'),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.phone),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.edit),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListTile(
                      title: const Text('Senha'),
                      subtitle: const Text('*******'),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.password),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.edit),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              splashRadius: 1,
              onPressed: () {},
              color: Theme.of(context).primaryColorLight,
              icon: const Icon(Icons.notifications)),
          IconButton(
              splashRadius: 1,
              onPressed: () {
                logout();
              },
              color: Theme.of(context).primaryColorDark,
              icon: const Icon(Icons.logout_sharp))
        ],
        leading: IconButton(
          splashRadius: 1,
          color: Theme.of(context).primaryColor,
          icon: const Icon(Icons.auto_awesome_mosaic_rounded),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeButtonCustom(
                        assetImage: const AssetImage("assets/farm1.png"),
                        title: "My Farm",
                        topLeft: 0,
                        topRight: 40,
                        bottomLeft: 40,
                        bottomRight: 0,
                        fn: () {
                          Navigator.of(context).pushNamed("/myfarm");
                        }),
                    HomeButtonCustom(
                        title: "Financial Services",
                        assetImage: const AssetImage("assets/saving.png"),
                        topLeft: 40,
                        topRight: 0,
                        bottomLeft: 0,
                        bottomRight: 40,
                        fn: () {
                          Navigator.of(context).pushNamed("/financialservices");
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeButtonCustom(
                        title: "Equipment",
                        assetImage: const AssetImage("assets/tractorfarm.png"),
                        topLeft: 40,
                        topRight: 0,
                        bottomLeft: 0,
                        bottomRight: 40,
                        fn: () {
                          Navigator.of(context).pushNamed("/equipment");
                        }),
                    HomeButtonCustom(
                        title: "Weather",
                        assetImage: const AssetImage("assets/cloudy-day.png"),
                        topLeft: 0,
                        topRight: 40,
                        bottomLeft: 40,
                        bottomRight: 0,
                        fn: () {
                          Navigator.of(context).pushNamed("/weather");
                        }),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: 250,
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: 35, color: Colors.white),
                          text: "34°C\n",
                          children: [
                            TextSpan(
                              text: "MAX",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.cloud,
                        color: Colors.white,
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: 35, color: Colors.white),
                          text: "29°C\n",
                          children: [
                            TextSpan(
                              text: "MIN",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 350,
                  width: 13,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                        )),
                    height: 250,
                    width: 170,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.cloud_circle,
                                color: Colors.white,
                                size: 40,
                              ),
                              Text(
                                "Fazenda boa sorte",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.wb_sunny,
                                color: Colors.white,
                                size: 40,
                              ),
                              Text(
                                "${userGlobal.usuario?.email} ",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
