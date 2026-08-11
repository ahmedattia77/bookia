import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String route) {
    return Navigator.pushNamed(this, route);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  void pop() => Navigator.pop(this);
}
