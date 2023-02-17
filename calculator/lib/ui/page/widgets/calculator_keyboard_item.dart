import 'package:flutter/material.dart';

/// 計算機：キーボードアイテム。
class CalculatorKeyboardItem extends StatelessWidget {
  const CalculatorKeyboardItem({
    Key? key,
    required this.value,
    required this.action,
  }) : super(key: key);

  /// 値。
  final String value;

  /// 押下時に呼ばれるアクション。
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: action,
      child: Text(value),
    );
  }
}
