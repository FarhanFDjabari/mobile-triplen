import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triplen_app/bloc/home/bloc.dart';
import 'package:triplen_app/screens/kontak_page.dart';
import 'package:triplen_app/screens/login_screen.dart';
import 'package:triplen_app/screens/premium_page.dart';
import 'package:triplen_app/utils/color_util.dart';

class ProfileScreen extends StatelessWidget {
  final HomeBloc homeBloc;
  ProfileScreen({Key key, this.homeBloc}) : super(key: key);

  _appVersion(BuildContext context) {
    return showDialog(
      builder: (context) => AlertDialog(
        title: Text('Triplen App',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
        content: Text(
          'Version 0.0.5',
          textAlign: TextAlign.center,
        ),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is UserLoggedOutState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (Route<dynamic> route) => false);
        }
      },
      child: BlocBuilder(
        bloc: homeBloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorUtil.backgroundColor,
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 25),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/logo-light.png'),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Profil",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 75,
                                width: 75,
                                margin: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0XFF64CEFF), width: 3),
                                    image: DecorationImage(
                                        image: NetworkImage(homeBloc.image))),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    homeBloc.name,
                                    style: TextStyle(
                                        color: ColorUtil.primaryColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    homeBloc.email,
                                    style: TextStyle(
                                        color: ColorUtil.greyColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PremiumPage())),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border(
                                    top: BorderSide(
                                        color: Color(0XFFD8D8D8), width: .5),
                                    bottom: BorderSide(
                                        color: Color(0XFFD8D8D8), width: .5),
                                  )),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Premium",
                                        style: TextStyle(
                                            color: Colors.orangeAccent
                                                .withOpacity(0.7),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        color: ColorUtil.greyColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => _appVersion(context),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border(
                                    top: BorderSide(
                                        color: Color(0XFFD8D8D8), width: .5),
                                    bottom: BorderSide(
                                        color: Color(0XFFD8D8D8), width: .5),
                                  )),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Tentang Aplikasi",
                                        style: TextStyle(
                                            color: Color(0XFFA1A1A1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        color: ColorUtil.greyColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KontakKami())),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      border: Border(
                                    top: BorderSide(
                                        color: Color(0XFFD8D8D8), width: .5),
                                    bottom: BorderSide(
                                        color: Color(0XFFD8D8D8), width: .5),
                                  )),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Kontak Kami",
                                        style: TextStyle(
                                            color: Color(0XFFA1A1A1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        color: ColorUtil.greyColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              homeBloc.dispatch(LogoutEvent());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal:
                                      MediaQuery.of(context).size.width / 4),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: ColorUtil.secondaryColor),
                              child: Text(
                                "Keluar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
