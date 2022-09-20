import 'package:class_assignment/edit.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Details extends StatefulWidget {
  Details({Key? key, required this.user}) : super(key: key);
  User user;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.img),
            ),
            Text(widget.user.name),
            Text(widget.user.email),
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Edit(user: widget.user),
                  ),
                );
                setState(() {
                });
              },
              child: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
