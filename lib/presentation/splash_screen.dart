import 'package:flutter/material.dart';
import 'package:foodie_maker/containers/handle_init_app.dart';
import 'package:foodie_maker/presentation/home_screen.dart';
import 'package:foodie_maker/widgets/loading_indicator.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => HandleInitApp(
        builder: (context, vm) {
          if (vm.isLoading) LoadingIndicator();
          return HomeScreen(
          );
        },
      );
}
