import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indonesia/indonesia.dart';
import 'package:recase/recase.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:triplen_app/bloc/board/bloc.dart';
import 'package:triplen_app/models/board_detail_model.dart';
import 'package:triplen_app/models/board_model.dart';
import 'package:triplen_app/screens/new_plan_page.dart';
import 'package:triplen_app/utils/color_util.dart';
import 'package:triplen_app/utils/screen_util.dart';

class DetailBoardPage extends StatefulWidget {
  final BoardBloc boardBloc;
  final BoardDataModel data;
  DetailBoardPage({Key key, this.boardBloc, this.data}) : super(key: key);

  @override
  _DetailBoardPageState createState() => _DetailBoardPageState();
}

class _DetailBoardPageState extends State<DetailBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data.board,
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
      backgroundColor: ColorUtil.backgroundColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Container(
            width: ScreenUtil.screenWidthDp,
            height: ScreenUtil.screenHeightDp,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Daftar Rencana",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtil.secondaryColor,
                          ),
                            child:
                            Icon(Icons.add, color: Colors.white,)
                        ),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewPlanPage())),
                      )

                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.only(top: 15),
                  child: widget.boardBloc.listTask.length > 0 ?
                  ListView.builder(
                    itemCount: widget.boardBloc.listTask.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      BoardDetailDataModel data = widget.boardBloc.listTask[index];
                      return InkWell(
                        onTap: () {},
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
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
                              onTap: () {},
                            )
                          ],
                          secondaryActions: <Widget>[
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: ColorUtil.greenColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () => showAsBottomSheet(),
                            )
                          ],
                        ),
                      );
                    },
                  ) : Container(
                    child: Text("Belum ada task yang dibuat", style: TextStyle(color: ColorUtil.greyColor),)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Selesai",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: widget.boardBloc.listDoneTask.length > 0 ?
                    ListView.builder(
                      itemCount: widget.boardBloc.listDoneTask.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        BoardDetailDataModel data = widget.boardBloc.listDoneTask[index];
                        return Container(
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
                                  Text(data.task,
                                      style: TextStyle(
                                          color: ColorUtil.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  Text(data.location,
                                      style: TextStyle(
                                          color: ColorUtil.greyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
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
                        );
                      },
                    ) : Container(
                      child: Text("Belum ada task yang selesai", style: TextStyle(color: ColorUtil.greyColor),),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: ColorUtil.greyColor,
              offset: Offset.fromDirection(3.0)
          )
        ]),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorUtil.secondaryColor),
            child: Text(
              "Selesai Melakukan Perjalanan",
              style:
              TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  void showAsBottomSheet() async {
    final result = await showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height/1.5,
            child: Material(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 5,top: 25),
                        padding: EdgeInsets.only(left: 0,right: 115),
                        child: Text(
                          'Liburan ke Bali',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50, right: 50, bottom: 40, top: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Biaya yang dikeluarkan',
                              prefixText: 'Rp '
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 55),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: ColorUtil.secondaryColor, width: 1)),
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
                          InkWell(
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
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
