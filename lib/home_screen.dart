import 'package:deneme/main_screen.dart';
import 'package:deneme/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passController = TextEditingController();
  TextEditingController _mailController = TextEditingController();

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.abc,
        ),
        title: const Text(
          "test",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        actions: const [
          Icon(Icons.arrow_back),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: "test",
              icon: Icon(
                Icons.add,
              )),
          BottomNavigationBarItem(
              label: "test",
              icon: Icon(
                Icons.add,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextTest(),
              TextFormField(
                controller: _mailController,
                decoration: const InputDecoration(
                  fillColor: Colors.red,
                  // labelText: "mail adresi",
                  hintText: "mail",
                  icon: Icon(Icons.mail),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Burayi bos birakma.";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    fillColor: Colors.red,
                    // labelText: "mail adresi",
                    hintText: "password",
                    icon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Burayi bos birakma.";
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                print(_mailController.text);
                                print(_passController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(
                                      pass: _passController.text,
                                      mail: _mailController.text,
                                    ),
                                  ),
                                );
                              },
                              child: Text("tamam"),
                            )
                          ],
                          title: Text(
                            'olumlu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text('Context text'),
                        );
                      },
                    );
                  }
                },
                child: const Text("giris yap"),
              ),
              Text(counter.toString())
            ],
          ),
        ),
      ),
    );
  }
}

class TextTest extends StatelessWidget {
  const TextTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("sistemimize hosgeldiniz");
  }
}
