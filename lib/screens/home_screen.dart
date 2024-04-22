import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = "";
  final ScrollController _scrollController = ScrollController();
  bool equalCLicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, 'appinfo');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            alignment: Alignment.bottomRight,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Text(
                  // ignore: unrelated_type_equality_checks
                  data.isNotEmpty ? data : "0",
                  // data.join(""),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circleBtn("AC", Colors.grey, Colors.black),
                    circleBtn("%", Colors.grey, Colors.black),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (data.isNotEmpty) {
                            if (data.isNotEmpty) {
                              data = data.substring(0, data.length - 1);
                            }
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.grey,
                        minimumSize: const Size(90, 90),
                      ),
                      child: const Icon(
                        Icons.backspace,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                    circleBtn("/", Colors.amber[700]!, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circleBtn("7", Colors.grey, Colors.black),
                    circleBtn("8", Colors.grey, Colors.black),
                    circleBtn("9", Colors.grey, Colors.black),
                    circleBtn("x", Colors.amber[700]!, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circleBtn("4", Colors.grey, Colors.black),
                    circleBtn("5", Colors.grey, Colors.black),
                    circleBtn("6", Colors.grey, Colors.black),
                    circleBtn("-", Colors.amber[700]!, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circleBtn("1", Colors.grey, Colors.black),
                    circleBtn("2", Colors.grey, Colors.black),
                    circleBtn("3", Colors.grey, Colors.black),
                    circleBtn("+", Colors.amber[700]!, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circleBtn("0", Colors.grey, Colors.black),
                    circleBtn(".", Colors.grey, Colors.black),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (data.isNotEmpty) {
                            try {
                              data = (data
                                  .replaceAll(RegExp('x'), '*')
                                  .interpret()
                                  .toString());
                            } catch (e) {
                              // ignore: avoid_print
                              print(e);
                            }

                            equalCLicked = true;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        // shape: const CircleBorder(),
                        backgroundColor: Colors.amber[700],
                        minimumSize: const Size(200, 90),
                      ),
                      child: const Text(
                        "=",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton circleBtn(String name, Color bgcolor, Color txtcolor) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
          if (name == "AC") {
            data = "";
          } else {
            if (equalCLicked) {
              data = name;
              equalCLicked = false;
            } else {
              data += name;
            }
          }
          // result = name as double;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: bgcolor,
        minimumSize: const Size(90, 90),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
      ),
    );
  }
}
