import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Risk Calculator',
      home: RiskCalculator(),
    );
  }
}

class RiskCalculator extends StatefulWidget {
  @override
  _RiskCalculatorState createState() => _RiskCalculatorState();
}

class _RiskCalculatorState extends State<RiskCalculator> {
  double balance = 0;
  double riskPercent = 1;
  double stopLoss = 100;
  double lotSize = 0;

  void calculateLot() {
    double riskAmount = (riskPercent / 100) * balance;
    lotSize = (riskAmount / (stopLoss * 0.01)) * 0.01;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('حاسبة اللوت')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'رأس المال (\$)'),
              keyboardType: TextInputType.number,
              onChanged: (val) => balance = double.tryParse(val) ?? 0,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'نسبة المخاطرة (%)'),
              keyboardType: TextInputType.number,
              onChanged: (val) => riskPercent = double.tryParse(val) ?? 1,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'ستوب لوس (نقطة)'),
              keyboardType: TextInputType.number,
              onChanged: (val) => stopLoss = double.tryParse(val) ?? 100,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateLot,
              child: Text('احسب اللوت'),
            ),
            SizedBox(height: 20),
            Text('اللوت المناسب: ${lotSize.toStringAsFixed(3)}')
          ],
        ),
      ),
    );
  }
}
