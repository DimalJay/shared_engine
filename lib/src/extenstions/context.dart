import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;

  ThemeData get theme => Theme.of(this);

  void navigate(Widget child) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => child));

  void navigateReplace(Widget child) => Navigator.of(this)
      .pushReplacement(MaterialPageRoute(builder: (_) => child));

  void back() => Navigator.of(this).pop();
}
