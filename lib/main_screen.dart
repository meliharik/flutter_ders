import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainScreen extends StatefulWidget {
  final String mail;
  final String pass;
  const MainScreen({
    super.key,
    required this.mail,
    required this.pass,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [Text(widget.mail), Text(widget.pass)],
        ),
      ),
    );
  }
}
