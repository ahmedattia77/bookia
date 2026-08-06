import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String route) {
    return Navigator.pushNamed(this, route);
  }

  void pop() => Navigator.pop(this);
}
