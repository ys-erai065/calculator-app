import 'package:calculator/ui/page/calculator_page_state.dart';
import 'package:calculator/ui/page/calculator_type.dart';
import 'package:calculator/ui/page/widgets/calculator_keyboard_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 計算機画面。
class CalculatorPage extends StatelessWidget {
  const CalculatorPage._({Key? key}) : super(key: key);

  /// Provider登録。
  ///
  /// ChangeNotifierProviderにCalculatorPageStateを設定することで、
  /// CalculatorPageStateのnotifyListener()が呼ばれた際に、
  /// 再度childに設定されているCalculatorPageがbuildされる。
  static provide() => ChangeNotifierProvider(
        create: (_) => CalculatorPageState(),
        child: const CalculatorPage._(),
      );

  @override
  Widget build(BuildContext context) {
    final state = context.read<CalculatorPageState>();
    final text = context.select(
      (CalculatorPageState state) => state.text,
    );
    final item = context.select(
      (CalculatorPageState state) => state.keyboardItem,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('電卓App'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),

              /// TODO: （STEP1）枠線や背景色など、自由に変えてみましょう
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    text,

                    /// TODO: （STEP1）テキストを右寄せしてみましょう！
                    /// https://zenn.dev/seito/articles/e72920dbb61606
                    style: const TextStyle(
                      fontSize: 48,
                    ),
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
                    itemCount: item.length,
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
                          value: item[index].toString(),
                          action: () => state.onTapNumber(
                            value: item[index],
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
                        value: 'ＡＣ',
                        action: () => state.clear(),
                      ),
                      CalculatorKeyboardItem(
                        value: '＋',
                        action: () {
                          state.onChangeType(type: CalculatorType.add);
                        },
                      ),

                      /// TODO: (STEP3)引き算ができるようにしましょう。
                      CalculatorKeyboardItem(
                        value: 'ー',
                        action: () {
                          state.onChangeType(type: CalculatorType.sub);
                        },
                      ),

                      /// TODO: (STEP4)現状このボタンを押す前に計算してしまっているので、このボタンを押したタイミングで計算が走るようにStateを触ってみましょう。
                      CalculatorKeyboardItem(value: '＝', action: () {}),
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
