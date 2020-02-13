import 'package:flutter/material.dart';
import 'package:triplen_app/screens/home_screen.dart';
import 'package:triplen_app/utils/color_util.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 65),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(color: Color(0XFFD3D6DA).withAlpha(50), offset: Offset(0, 2), blurRadius: 1,
                        spreadRadius: 1)
                  ]
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Image.asset('assets/login-image.png'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Selamat datang di Triplen!",
                        style: TextStyle(color: ColorUtil.primaryColor, fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        "Triplen app membuat pengalaman liburanmu menjadi lebih seru dan menakjubkan.",
                        style: TextStyle(color: ColorUtil.greyColor, fontSize: 14, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 52,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color(0XFFD3D6DA).withAlpha(50), offset: Offset(0, 2), blurRadius: 1,
                        spreadRadius: 1)
                  ]
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen()
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/google-signin.png'),
                      SizedBox(width: 8),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(color: Color(0XFF393939), fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Image.asset('assets/logo-dark.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
