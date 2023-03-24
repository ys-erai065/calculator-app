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
    /// TODO: （STEP2）キーボードデザインを変更してみましょう！（角丸や、文字色など）
    /// 参考）
    /// https://docs.flutter.dev/release/breaking-changes/buttons
    /// https://qiita.com/coka__01/items/30716f42e4a909334c9f
    return OutlinedButton(
      onPressed: action,
      child: Text(value),
    );
  }
}
