import 'package:calculator/ui/page/calculator_page_state.dart';
import 'package:calculator/ui/page/widgets/calculator_keyboard_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 計算機画面。
class CalculatorPage extends StatelessWidget {
  const CalculatorPage._({Key? key}) : super(key: key);

  static provide() => ChangeNotifierProvider(
        create: (_) => CalculatorPageState(),
        child: const CalculatorPage._(),
      );

  @override
  Widget build(BuildContext context) {
    final state = context.read<CalculatorPageState>();
    final text = context.select((CalculatorPageState state) => state.text);
    return Scaffold(
      appBar: AppBar(
        title: const Text('電卓App'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100, border: Border.all(width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  // ★ExpandedでGridViewをラップする。
                  child: GridView.builder(
                    itemCount: 9,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(4),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: CalculatorKeyboardItem(
                          value: index.toString(),
                          action: () => state.addText(
                            index.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CalculatorKeyboardItem(
                          value: 'AC', action: () => state.clear()),
                      CalculatorKeyboardItem(value: '+', action: () {}),
                      CalculatorKeyboardItem(value: '=', action: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
