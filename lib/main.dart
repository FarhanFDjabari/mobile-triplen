import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triplen_app/bloc/bloc_delegate.dart';
import 'package:triplen_app/bloc/board/bloc.dart';
import 'package:triplen_app/bloc/home/bloc.dart';
import 'package:triplen_app/bloc/main/bloc.dart';
import 'package:triplen_app/screens/splash_screen.dart';
import 'package:triplen_app/utils/color_util.dart';

Future<Null> main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MainBloc mainBloc = MainBloc();
  HomeBloc homeBloc = HomeBloc();
  BoardBloc boardBloc = BoardBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(builder: (context) => mainBloc,),
        BlocProvider<HomeBloc>(builder: (context) => homeBloc,),
        BlocProvider<BoardBloc>(builder: (context) => boardBloc,),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: ColorUtil.primaryColor,
          primaryColorDark: ColorUtil.secondaryColor,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
