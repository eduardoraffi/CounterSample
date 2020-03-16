import 'package:counter_sample/home/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/widgets/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              title: TextStyle(
                  color: Color(0xFF444749),
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          colorScheme: ColorScheme(
              primary: Color(0xFF19345A),
              primaryVariant: Color(0xFF218BCC),
              secondary: Color(0xFFFF9502),
              secondaryVariant: Color(0xFFC4C9CB),
              surface: Colors.white,
              background: Color(0xFF519DCE),
              error: Colors.white,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Colors.white,
              onBackground: Colors.white,
              onError: Colors.white,
              brightness: Brightness.light),
        ),
        home: BlocProvider<HomeBloc>(
          create: (context) => _homeBloc..add(HomeInitialEvent()),
          child: BlocListener(
            bloc: _homeBloc,
            listener: (BuildContext context, HomeState state) {
              print(state);
            },
            child: BlocBuilder(
              bloc: _homeBloc,
              builder: (context, state) {
                return _initialScreen();
              },
            ),
          ),
        ),
      );

  _initialScreen() => HomeScreen();
}
