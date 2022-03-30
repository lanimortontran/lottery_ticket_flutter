import 'dart:math';

import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  final List<int> lottoNumbers;

  ResultsScreen({Key? key, required this.lottoNumbers}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<int> winningNumbers = [];
  int matched = 0;

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      int randomNumber = Random().nextInt(100);
      winningNumbers.add(randomNumber);

      if (widget.lottoNumbers.contains(randomNumber)) {
        matched++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lotto'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('The winning numbers are:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getNumbers(winningNumbers),
          ),
          SizedBox(height: 50.0),
          Text('Your ticket:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getNumbers(widget.lottoNumbers),
          ),
          SizedBox(height: 50.0),
          Text('$matched of ${winningNumbers.length} matched'),
          winningNumbers.length == matched ? Text('You win!') : Text('Try again next time'),
        ],
      ),
    );
  }

  List<Widget> getNumbers(List<int> numbers) {
    List<Widget> numberFields = [];
    for (int i = 0; i < numbers.length; i++) {
      numberFields.add(Text('${numbers[i]}'));

      if (i < numbers.length - 1) {
        numberFields.add(SizedBox(
          width: 10.0,
        ));
      }
    }

    return numberFields;
  }
}
