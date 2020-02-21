import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triplen_app/bloc/home/bloc.dart';
import 'package:triplen_app/screens/main_screen.dart';
import 'package:triplen_app/screens/profile_screen.dart';
import 'package:triplen_app/utils/color_util.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screen = 1;
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.dispatch(InitialHomeEvent());
    // TODO: implement initState
    super.initState();
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Konfirmasi Keluar', style: TextStyle(fontSize: 20.0)),
            content: Text('Apakah anda ingin keluar?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  // this line exits the app.
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: Text('YA', style: TextStyle(fontSize: 18.0)),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                // this line dismisses the dialog
                child: Text('TIDAK', style: TextStyle(fontSize: 18.0)),
              )
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: ColorUtil.backgroundColor,
        body: SafeArea(
          top: true,
          child: BlocListener(
            bloc: homeBloc,
            listener: (context, state) {

            },
            child: BlocBuilder(
              bloc: homeBloc,
              builder: (context, state) {
                if (state is HomeLoadedDataState) {
                  return MainScreen(homeBloc: homeBloc,);
                } else if (state is HistoryPageState) {
                  return MainScreen(homeBloc: homeBloc,);
                } else if (state is NewsPageState) {
                  return MainScreen(homeBloc: homeBloc,);
                } else if (state is ProfilePageState) {
                  return ProfileScreen(homeBloc: homeBloc,);
                } else {
                  return Container();
                }
              },
            ),
          )
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Color(0XFFD3D6DA).withAlpha(50), offset: Offset(0, -2), blurRadius: 1, spreadRadius: 1)
          ]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    homeBloc.dispatch(InitialHomeEvent());
                    setState(() {
                      screen = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Icon(Icons.dashboard,
                        color: screen == 1 ? ColorUtil.secondaryColor : ColorUtil.greyColor),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    homeBloc.dispatch(SwitchHistoryEvent());
                    setState(() {
                      screen = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Icon(
                      Icons.history,
                      color: screen == 2 ? ColorUtil.secondaryColor : ColorUtil.greyColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    homeBloc.dispatch(SwitchNewsEvent());
                    setState(() {
                      screen = 3;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Icon(
                      Icons.search,
                      color: screen == 3 ? ColorUtil.secondaryColor : ColorUtil.greyColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    homeBloc.dispatch(SwitchProfileEvent());
                    setState(() {
                      screen = 4;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Icon(
                      Icons.account_circle,
                      color: screen == 4 ? ColorUtil.secondaryColor : ColorUtil.greyColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
