import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scorekeeper = [
    Icon(Icons.check_box, color: Colors.green),
    Icon(
      Icons.close_outlined,
      color: Colors.red,
    ),
  ];
  List<String> question = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];
  List<bool> answer = [false, true, true];
  int questionnumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question[questionnumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
              ),
              onPressed: () {
                bool correctanswer = answer[questionnumber];
                if (correctanswer == true) {
                  print('user is right');
                } else {
                  print(('User is wrong'));
                }
                setState(() {
                  questionnumber++;
                  scorekeeper.add(
                    Icon(
                      Icons.check_box,
                      color: Colors.green,
                    ),
                  );
                });
              },
              child: Text(
                'TRUE',
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // foreground
              ),
              onPressed: () {
                bool correctanswer = answer[questionnumber];
                if (correctanswer == false) {
                  print('user is right');
                } else {
                  print('User is wrong');
                }
                setState(() {
                  questionnumber++;
                  scorekeeper.add(
                    Icon(
                      Icons.close_sharp,
                      color: Colors.red,
                    ),
                  );
                });
              },
              child: Text('FALSE'),
            ),
          ),
          //TODO: Add a Row here as your score keeper
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
