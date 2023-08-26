
import 'package:flutter/material.dart';

import '../../../../core/routes/router.dart';

void customNavigationMethodWithCustomNavigator(
    BuildContext context, Widget destination) {
  Navigator.of(context).push(CustomRouterRotation(destination));
}
