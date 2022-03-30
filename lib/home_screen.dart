import 'package:flutter/material.dart';
import 'package:lottery_ticket_flutter/constants.dart';
import 'package:lottery_ticket_flutter/results_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int?> lottoNumbers = List<int?>.filled(5, null);

  @override
  Widget build(BuildContext context) {
    print(lottoNumbers);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lotto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('Pick your numbers'),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: getLottoNumberInputFields(),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: lottoNumbers.contains(null)
                  ? null
                  : () {
                      List<int> finalLottoNumbers = [];
                      for (var lottoNumber in lottoNumbers) {
                        finalLottoNumbers.add(lottoNumber!);
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsScreen(lottoNumbers: finalLottoNumbers)));
                    },
              child: Text('Did I win?'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getLottoNumberInputFields() {
    List<Widget> inputFields = [];
    for (int i = 0; i < lottoNumbers.length; i++) {
      inputFields.add(Expanded(
        child: TextField(
          decoration: kTextFieldInputDecoration,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              lottoNumbers[i] = int.tryParse(value);
            });
          },
        ),
      ));

      if (i < lottoNumbers.length - 1) {
        inputFields.add(SizedBox(width: 10.0));
      }
    }
    return inputFields;
  }
}
