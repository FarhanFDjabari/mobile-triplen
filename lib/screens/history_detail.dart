import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indonesia/indonesia.dart';
import 'package:recase/recase.dart';
import 'package:triplen_app/bloc/board/board_bloc.dart';
import 'package:triplen_app/models/board_detail_model.dart';
import 'package:triplen_app/models/board_model.dart';
import 'package:triplen_app/utils/color_util.dart';

class HistoryDetail extends StatefulWidget {
  final BoardDataModel data;
  HistoryDetail({Key key, this.data}) : super(key: key);
  @override
  _HistoryDetailState createState() => _HistoryDetailState();
}

  class _HistoryDetailState extends State<HistoryDetail> {
  BoardBloc boardBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riwayat",
          style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              margin: EdgeInsets.only(top: 20, left: 0, right: 150),
              child: Text(
                'Rincian',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(top: 15),
              child: boardBloc.listTask.length > 0 ?
              ListView.builder(
                itemCount: boardBloc.listTask.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  BoardDetailDataModel data = boardBloc.listTask[index];
                  return InkWell(
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0XFFD3D6DA).withAlpha(50),
                                offset: Offset(0, 1),
                                blurRadius: 1,
                                spreadRadius: 1)
                          ],
                          color: Colors.white),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(ReCase(data.task).titleCase,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.location_on, color: ColorUtil.greyColor, size: 14,),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(data.location,
                                            style: TextStyle(
                                                color: ColorUtil.greyColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                tanggal(data.date, shortMonth: true),
                                style: TextStyle(
                                    color: ColorUtil.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ) : Container(
                  padding: EdgeInsets.symmetric(horizontal: 110),
                  child: Text("Belum ada task yang selesai", style: TextStyle(color: ColorUtil.greyColor),)),
            ),
          ],
        ),
      ),
    );
  }
}