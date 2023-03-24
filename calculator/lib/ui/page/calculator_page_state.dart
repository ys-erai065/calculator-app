import 'package:flutter/material.dart';

import 'calculator_type.dart';

/// 計算機の状態管理。
///
/// ChangeNotifierを継承することで、notifyListeners()を用いて、
/// 変更をPageクラスに伝播することが可能。
class CalculatorPageState extends ChangeNotifier {
  /// 合計値。
  int _total = 0;

  /// キーボード
  List<int> get keyboardItem => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  /// テキストに表示する値の取得。
  String get text => _total.toString();

  /// 計算
  CalculatorType _type = CalculatorType.none;

  /// 計算処理。
  void calculator({required int value}) {}

  /// 計算種別変更。
  void onChangeType({required CalculatorType type}) {
    _type = type;
    notifyListeners();
  }

  /// 数値入力時のアクション。
  ///
  /// 数値タップ時に現在の計算種別に応じて、必要な計算あるいは文字結合を実施する。
  /// 計算完了後は[CalculatorType]をnoneに戻す。
  void onTapNumber({required int value}) {
    switch (_type) {
      case CalculatorType.none:
        _total = int.parse(_total.toString() + value.toString());
        break;
      case CalculatorType.add:
        _total += value;
        break;
      default:
        break;
    }
    _type = CalculatorType.none;
    notifyListeners();
  }

  /// テキスト内文字クリア。
  void clear() {
    _total = 0;
    notifyListeners();
  }
}
