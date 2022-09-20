import 'package:flutter/material.dart';
import 'details.dart';

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
        primarySwatch: Colors.blue,
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
  int _counter = 0;

  List<User> users = [
    User(
        name: "Google",
        email: "google@gmail.com",
        img: "https://blog.hubspot.com/hubfs/image8-2.jpg"),
    User(
        name: "Facebook",
        email: "facebook@gmail.com",
        img: "https://1000logos.net/wp-content/uploads/2016/11/fb-logo.jpg"),
    User(
        name: "Apple",
        email: "apple@gmail.com",
        img:
        "https://media.designrush.com/inspiration_images/134802/conversions/_1511456315_653_apple-mobile.jpg"),
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
            children: users
                .map(
                  (user) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                    //   onTap: Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (BuildContext context)) =>
                    //        Details(),
                    // ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Details(user: user)),
                        );
                        setState(() {
                        });
                      },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.img),
                    ),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  ),
            ),
          )
              .toList(),
        )),);
  }
}

class User {
  String name;
  String email;
  String img;

  User({
    required this.name,
    required this.email,
    required this.img,
  });
}
