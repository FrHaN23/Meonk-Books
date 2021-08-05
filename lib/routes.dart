import 'package:buku_meonk/info.dart';
import 'package:buku_meonk/main.dart';
import 'package:flutter/material.dart';

Route goToInfoScreen(book, isMarked) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => InfoScreen(
      book: book,
      isMarked: isMarked,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route goToHome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Main(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
