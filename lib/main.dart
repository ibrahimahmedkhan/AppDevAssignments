import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [
    User(
        name: "Google",
        email: "gmail.com",
        views: 0,
        img: "assets/WindowsXP.jpeg",
        isHearted: false),
    User(
        name: "Google",
        email: "gmail.com",
        views: 0,
        img: "assets/waterBaptism.jpeg",
        isHearted: false),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      // child: Card(user: users[0])
      child: ListView(
        children: users
            .map(
              (user) => Card(user: user),
            )
            .toList(),
      ),
    ));
  }
}

class Card extends StatelessWidget {
  const Card({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        elevation: 8.0,
        shape:  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ClipPath(
          clipper: const ShapeBorderClipper(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)))),
          child: Column(children: [
            Image(
              image: AssetImage(user.img),
            ),
            ListTile(
              
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF445962),
                child: Text(user.name.substring(0, 1)),
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
              // trailing: Text(user.views.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Icon(Icons.favorite),
                      Row(
                        children: [
                          const Icon(Icons.remove_red_eye_rounded),
                          Text(user.views.toString())
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final int views;
  final String img;
  final bool isHearted;

  User(
      {required this.name,
      required this.email,
      required this.views,
      required this.img,
      required this.isHearted});
}
