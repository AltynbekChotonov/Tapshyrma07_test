import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    required this.tuuraButtonbu,
    Key? key,
    required this.baskanda,
  }) : super(key: key);

  final bool tuuraButtonbu;

  // 13:
  // final --> Мен бир гана жолу маани берем да кийин аны озгортбойт
  // void --> returnType (ech nerse kartarbait)
  // Function --> Фунция
  // () --> функция экенин билдирет (чакырылды)
  // bool --> функцияны берип жатканда колдонуучу жардамчы параметр
  // baskanda --> аталышы
  final void Function(bool) baskanda;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        // onPressed --> property (параметр же касиет)
        onPressed: () => baskanda(tuuraButtonbu),
        style: ElevatedButton.styleFrom(
          primary: tuuraButtonbu ? const Color(0xff4CAF52) : const Color(0xffF54335),
        ),
        child: Text(
          tuuraButtonbu ? 'Туура' : 'Туура эмес',
          style: const TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
