import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  static Color startColor = Colors.cyan;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String player1 = "assets/images/rock.png";
  String player2 = "assets/images/rock.png";
  String winner = "";
  var winnerOfRPS = "player 1";
  String winnerText = "";

  void playfunction1() {
    final List play1 = [
      "assets/images/rock.png",
      "assets/images/paper.png",
      "assets/images/scissors.png",
    ];
    var randomNumber = Random().nextInt(3);
    var selectedPlayer1 = play1[randomNumber];
    setState(() {
      player1 = selectedPlayer1;
    });
  }

  void playfunction2() {
    final List play2 = [
      "assets/images/rock.png",
      "assets/images/paper.png",
      "assets/images/scissors.png",
    ];
    var randomNumber = Random().nextInt(3);
    var selectedPlayer2 = play2[randomNumber];
    setState(() {
      player2 = selectedPlayer2;
    });
  }

  void WicalculateWinnernner() {
    var winnerReult = "";
    if (player1 == "rock" && player2 == "scissors") {
      winnerReult = "player 1";
      print("$player1 won");
    } else if (player1 == "scissors" && player2 == "paper") {
      winnerReult = "player 1";
      print("$player1 won");
    } else if (player1 == "paper" && player2 == "rock") {
      winnerReult = "player 1";
      print("$player1 won");
    } else if (player1 == player2) {
      winnerReult = "TIE";
      print(" TIE");
    } else {
      winnerReult = "player 2";
    }
    setState(() {
      winnerOfRPS = winnerReult;
      winnerText = "Winner: $winnerOfRPS";
    });
  }

  changeBackground() {
    Color color = Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
        Random().nextInt(256), Random().nextInt(256));
    setState(() {
      MyApp.startColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyApp.startColor,
        appBar: AppBar(
          title: Center(
            child: Text(
              "rock paper and scissors",
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: MyApp.startColor, //backgroundColor: Colors.amber,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset("$player1"),
                      Text("Player: 1"),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("$player2"),
                      Text("Player: 2"),
                    ],
                  ),
                ],
              ),
              Text(
                winnerText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(40.0),
                    child: TextButton(
                      onPressed: () {
                        playfunction2();
                        playfunction1();
                        changeBackground();
                        WicalculateWinnernner();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                      ),
                      child: Text(
                        "Press me!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
