import 'package:flutter/material.dart';
import 'package:tapshyrma_7/model/quiz_model.dart';
import 'package:tapshyrma_7/widget/quiz_button.dart';

import 'widget/result_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List jooptor = <bool>[];
  List tuuraJooptor = <bool>[];
  List kataJooptor = <bool>[];

  void teksher(bool value) {
    if (quizzes[index].answer == value) {
      jooptor.add(true);
      tuuraJooptor.add(true);
    } else {
      jooptor.add(false);
      kataJooptor.add(false);
    }
    setState(() {
      if (quizzes[index] == quizzes.last) {
        index = 0;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Сиз бул тесттен'),
              content: Text(
                  'туура жооп ${tuuraJooptor.length}/ката жооп ${kataJooptor.length} таптыныз'),
            );
          },
        );
        jooptor.clear();
        // tuuraJooptor.clear();
        // kataJooptor.clear();
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              quizzes[index].question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            const Spacer(),
            QuizButton(
              tuuraButtonbu: true,
              baskanda: (maani) {
                teksher(maani);
              },
            ),
            const SizedBox(height: 20),
            QuizButton(
              tuuraButtonbu: false,
              baskanda: (maani) {
                teksher(maani);
              },
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: jooptor.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  return jooptor[i]
                      ? const ResultIcon(true)
                      : const ResultIcon(false);
                },
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Тапшырма - 07',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
