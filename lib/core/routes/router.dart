import 'package:flutter/cupertino.dart';

class CustomRouter extends PageRouteBuilder {
  CustomRouter(Widget child)
      : super(
          pageBuilder: (context, a1, a2) => child,
          transitionsBuilder: (contex, a1, a2, child) {
            const begin = Offset(1, 1);
            const end = Offset.zero;
            var curve = Curves.ease;
            var curveTween = CurveTween(curve: curve);
            final tween = Tween(begin: begin, end: end).chain(curveTween);
            final offsetAnimation = a1.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

class CustomRouterRotation extends PageRouteBuilder {
  CustomRouterRotation(Widget child)
      : super(
          pageBuilder: (context, a1, a2) => child,
          transitionsBuilder: (contex, a1, a2, child) {
            const begin = 0.0;
            const end = 1.0;
            var curve = Curves.ease;
            var curveTween = CurveTween(curve: curve);
            final tween = Tween(begin: begin, end: end).chain(curveTween);
            final offsetAnimation = a1.drive(tween);

            return RotationTransition(
              turns: offsetAnimation,
              child: child,
            );
          },
        );
}
