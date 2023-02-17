import 'package:flutter/material.dart';

/// 計算機の状態。
class CalculatorPageState extends ChangeNotifier {
  /// 合計値。
  String _text = '';

  /// 合計値の取得。
  String get text => _text;

  /// 計算処理。
  void calculator({required int value}) {}

  /// テキスト追加。
  void addText(String value) {
    _text += value;
    notifyListeners();
  }

  /// テキスト内文字クリア。
  void clear() {
    _text = '';
    notifyListeners();
  }
}
