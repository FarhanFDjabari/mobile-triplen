import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:triplen_app/bloc/main/bloc.dart';
import 'package:triplen_app/models/history_model.dart';
import 'package:triplen_app/screens/history_detail.dart';
import 'package:triplen_app/utils/color_util.dart';

class HistoryScreen extends StatelessWidget{
  MainBloc mainBloc;
  HistoryScreen({Key key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    mainBloc = BlocProvider.of<MainBloc>(context);
    mainBloc.dispatch(LoadHistoryEvent());
    return BlocListener(
      bloc: mainBloc,
      listener: (context, state) {

      },
      child: BlocBuilder(
        bloc: mainBloc,
        builder: (context, state) {
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
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Riwayat Perjalanan",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Image.asset('assets/logo-light.png'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(top: 15),
                      child: state is HistoryLoadedState ? mainBloc.listHistory.length > 0 ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: mainBloc.listHistory.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          HistoryDataModel data = mainBloc.listHistory[index];
                          return InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HistoryDetail(data: data,))),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                                          color: ColorUtil.greyColor),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(data.board,
                                          style: TextStyle(
                                              color: ColorUtil.primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                      Text("Trip mulai pada tanggal " + tanggal(data.date, shortMonth: true),
                                          style: TextStyle(
                                              color: ColorUtil.greyColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal)),
                                      Container(
                                        child:
                                        Text(
                                          tanggal(data.start, shortMonth: true) + " - " + tanggal(data.done, shortMonth:
                                          true),
                                          style: TextStyle(
                                            color: ColorUtil.greyColor.withOpacity(0.8),
                                            fontSize: 14,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(top: 15),
                                      ),
                                      Container(
                                        child: Text(
                                          NumberFormat.currency(locale: 'id', decimalDigits: 0,
                                              symbol: 'Rp. ').format(int.parse(data.total.toString())),
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(top: 2),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                          color: ColorUtil.primaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ) : Center(child: Text("Belum ada riwayat rencana"),) : Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10),
                          child: CircularProgressIndicator())
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}