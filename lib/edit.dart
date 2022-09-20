import 'package:flutter/material.dart';

import 'main.dart';

class Edit extends StatefulWidget {
  Edit({Key? key, required this.user}) : super(key: key);
  User user;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  widget.user.name = value;
                });
              },
              decoration: InputDecoration(
                  hintText: widget.user.name, labelText: "Name"),
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  widget.user.email = value;
                });
              },
              decoration: InputDecoration(
                  hintText: widget.user.email, labelText: "Email"),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }
}
