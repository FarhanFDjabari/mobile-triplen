import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indonesia/indonesia.dart';
import 'package:toast/toast.dart';
import 'package:triplen_app/bloc/board/bloc.dart';
import 'package:triplen_app/bloc/home/bloc.dart';
import 'package:triplen_app/bloc/main/bloc.dart';
import 'package:triplen_app/models/board_model.dart';
import 'package:triplen_app/screens/detail_board_screen.dart';
import 'package:triplen_app/utils/color_util.dart';
import 'package:triplen_app/utils/shared_preferences.dart';


class MainScreen extends StatelessWidget {
  final HomeBloc homeBloc;
  final BoardBloc boardBloc = BoardBloc();
  final MainBloc mainBloc = MainBloc();
  MainScreen({Key key, this.homeBloc}) : super(key: key);

  final SharedPreferencesHelper help = SharedPreferencesHelper();

  @override
  Widget build(BuildContext context) {
    mainBloc.dispatch(LoadHomeEvent());
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
              BlocListener(
                bloc: boardBloc,
                listener: (context, state) {
                  if (state is BoardDetailLoadedState) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBoardPage(boardBloc:
                    boardBloc, data: state.data,)));
                  } else if (state is BoardDeletedErrorState) {
                    Toast.show(state.message, context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.BOTTOM);
                  } else if (state is BoardDeletedState) {
                    mainBloc.dispatch(LoadHomeEvent());
                    Toast.show("Board berhasil dihapus.", context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.BOTTOM);
                  }
                },
                child: BlocBuilder(
                  bloc: mainBloc,
                  builder: (context, state) {
                    return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        child: state is HomeLoadedState ? mainBloc.listBoards.length > 0 ?
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: mainBloc.listBoards.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            BoardDataModel data = mainBloc.listBoards[index];
                            return InkWell(
                              highlightColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () => boardBloc.dispatch(LoadDetailBoardEvent(data: data)),
                              child: Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  padding:
                                  EdgeInsets.symmetric(vertical: 15),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.symmetric(horizontal: 15),
                                          width: 15.0,
                                          height: 15.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorUtil.greenColor)),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(data.board,
                                                style: TextStyle(
                                                    color: ColorUtil.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500)),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Trip mulai pada tanggal " + tanggal(data.created, shortMonth: true),
                                                style: TextStyle(
                                                    color: ColorUtil.greyColor,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "Aktif",
                                            style: TextStyle(
                                                color: ColorUtil.greenColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                movementDuration: Duration(milliseconds: 500),
                                actions: <Widget>[
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: ColorUtil.redColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () => boardBloc.dispatch(DeleteBoardEvent(id: data.id)),
                                    focusColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                  )
                                ],
                                secondaryActions: <Widget>[
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
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
                                    focusColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                  )
                                ],
                              ),
                            );
                          },
                        ) :
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                          child: Text("Tidak ada rencana.", style: TextStyle(color: ColorUtil
                              .greyColor, fontSize: 16),),
                        ) :
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator())
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorUtil.secondaryColor,
        onPressed: () {},
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
}
