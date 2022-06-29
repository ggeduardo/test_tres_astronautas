import 'package:flutter/material.dart';
import 'package:tres_astronautas_test/matriz/ui/pages/home_page.dart';
import 'package:tres_astronautas_test/matriz/ui/pages/matriz_page.dart';
import 'package:tres_astronautas_test/nasa/ui/pages/nasa_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case HomePage.route:
        page = const HomePage();
        break;
      case MatrizPage.route:
        page = MatrizPage(data: settings.arguments as Map<String, dynamic>);
        break;
      case NasaPage.route:
        page = const NasaPage();
        break;
      default:
        page = const HomePage();
        break;
    }
    return RouteAnimation(page: page);
  }
}

class RouteAnimation extends PageRouteBuilder {
  final Widget page;
  final Offset? begin;
  final Offset? end;
  RouteAnimation({required this.page, this.begin, this.end})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var _begin = begin ?? const Offset(1.0, 0.0);
              var _end = end ?? Offset.zero;
              var curve = Curves.easeOut;
              var tween = Tween(
                begin: _begin,
                end: _end,
              ).chain(CurveTween(curve: curve)).animate(animation);

              return SlideTransition(position: tween, child: child);
            });
}
