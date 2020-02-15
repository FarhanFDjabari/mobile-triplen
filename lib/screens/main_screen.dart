import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';
import 'package:triplen_app/bloc/home/bloc.dart';
import 'package:triplen_app/screens/detail_board_screen.dart';
import 'package:triplen_app/utils/color_util.dart';
import 'package:triplen_app/utils/shared_preferences.dart';


class MainScreen extends StatelessWidget {
  final HomeBloc homeBloc;
  MainScreen({Key key, this.homeBloc}) : super(key: key);

  SharedPreferencesHelper help = SharedPreferencesHelper();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(left: 10, top: 8, bottom: 8, right: 15),
                    decoration: BoxDecoration(
                        color: ColorUtil.secondaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color: Colors.yellowAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          homeBloc.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset('assets/logo-light.png'),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Rencana-Ku ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(top: 15),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBoardPage())),
                      child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0XFFD3D6DA).withAlpha(50),
                                    offset: Offset(0, 1),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ],
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Container(
                                    width: 15.0,
                                    height: 15.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtil.greenColor)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Liburan Ke Bali $index",
                                      style: TextStyle(
                                          color: ColorUtil.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  Text("Liburan mulai tanggal 30 Januari",
                                      style: TextStyle(
                                          color: ColorUtil.greyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "30 Jan",
                                  style: TextStyle(
                                      color: ColorUtil.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        movementDuration: Duration(milliseconds: 500),
                        actions: <Widget>[
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: ColorUtil.redColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () => Toast.show("Board Deleted", context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.BOTTOM),
                          )
                        ],
                        secondaryActions: <Widget>[
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: ColorUtil.BlueShadow,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.archive,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () => Toast.show("Board Archived", context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.BOTTOM),
                          )
                        ],
                      ),
                    );
                  },
                )),
            Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 50,
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
