import 'package:buku_meonk/info.dart';
import 'package:buku_meonk/main.dart';
import 'package:buku_meonk/screens/favorite.dart';
import 'package:buku_meonk/screens/searchScreen.dart';
import 'package:flutter/material.dart';

Route goToInfoScreen(book, isMarked) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => InfoScreen(
      book: book,
      isMarked: !isMarked,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(5, 0);
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

Route goToHome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Main(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-2.0, 0.0);
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

Route goTofavorite() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FavoriteScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-2.0, 0.0);
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

Route goToSearch() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SearchScreenMain(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
