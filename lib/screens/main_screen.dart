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

  final SharedPreferencesHelper help = SharedPreferencesHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                            homeBloc.name ?? "Nama",
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorUtil.secondaryColor,
        onPressed: () => showAsBottomSheet(context),
        elevation: 1,
        hoverElevation: 3,
        focusElevation: 3,
        highlightElevation: 3,
        splashColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  void showAsBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ),
              color: Colors.white
            ),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Tambah Board',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(bottom: 20, top: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Nama Board',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 55),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorUtil.secondaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                  ),
                              child: Text(
                                "Batal",
                                style: TextStyle(
                                    color: ColorUtil.secondaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorUtil.primaryColor),
                              child: Text(
                                "Simpan",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}


