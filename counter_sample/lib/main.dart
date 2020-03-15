import 'package:counter_sample/home/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/widgets/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  HomeBloc _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Counter List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
      create: (context) => _homeBloc..add(HomeInitialEvent()),
        child: BlocListener(
          bloc: _homeBloc,
          listener: (BuildContext context, HomeState state){
            print(state);
          },
          child: BlocBuilder(
            bloc: _homeBloc,
            builder: (context, state){
              return _initialScreen();
            },
          ),
        ),
      ),
    );

  _initialScreen() => HomeScreen();
}

