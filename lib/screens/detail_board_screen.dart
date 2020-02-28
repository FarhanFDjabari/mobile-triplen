import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indonesia/indonesia.dart';
import 'package:recase/recase.dart';
import 'package:toast/toast.dart';
import 'package:triplen_app/bloc/board/bloc.dart';
import 'package:triplen_app/models/board_detail_model.dart';
import 'package:triplen_app/models/board_model.dart';
import 'package:triplen_app/screens/new_plan_page.dart';
import 'package:triplen_app/utils/color_util.dart';
import 'package:triplen_app/utils/screen_util.dart';

class DetailBoardPage extends StatefulWidget {
  final BoardDataModel data;
  DetailBoardPage({Key key, this.data}) : super(key: key);

  @override
  _DetailBoardPageState createState() => _DetailBoardPageState();
}

class _DetailBoardPageState extends State<DetailBoardPage> {
  BoardBloc boardBloc;
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    boardBloc = BlocProvider.of<BoardBloc>(context);
    boardBloc.dispatch(LoadDetailBoardEvent(data: widget.data));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: boardBloc,
      listener: (context, state) {
        if (state is TaskDeletedErrorState) {
          Toast.show(state.message, context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        } else if (state is TaskDeletedState) {
          boardBloc.dispatch(LoadDetailBoardEvent(data: widget.data));
          Toast.show("Destinasi telah dihapus.", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        } else if (state is TaskUpdatedState) {
          priceController.text = "";
          boardBloc.dispatch(LoadDetailBoardEvent(data: widget.data));
          Toast.show("Destinasi telah terupdate.", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          Navigator.pop(context);
        } else if (state is TaskUpdatedFailedState) {
          Toast.show(state.message, context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        }
      },
      child: BlocBuilder(
        bloc: boardBloc,
        builder: (context, state) {
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
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtil.secondaryColor,
                                  ),
                                  child:
                                  Icon(Icons.add, color: Colors.white,)
                              ),
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewPlanPage
                                (data: widget.data,))),
                            )

                          ],
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
                                    focusColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
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
                                    onTap: () => showDeleteAlert(context, data),
                                  )
                                ],
                                secondaryActions: <Widget>[
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
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
                                    onTap: () => showAsBottomSheet(context, data),
                                  )
                                ],
                              ),
                            );
                          },
                        ) : Container(
                            padding: EdgeInsets.symmetric(horizontal: 110),
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
                          child: boardBloc.listDoneTask.length > 0 ?
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: boardBloc.listDoneTask.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              BoardDetailDataModel data = boardBloc.listDoneTask[index];
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
                onTap: (){
                  if (boardBloc.listTask.length > 0) {
                    Toast.show("Masih ada rencana yang belum selesai!", context, duration: Toast.LENGTH_SHORT, gravity:
                    Toast.BOTTOM);
                  } else {

                  }
                },
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
        },
      ),
    );
  }
  void showAsBottomSheet(BuildContext context, BoardDetailDataModel data) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              color: Colors.transparent,
              child: Wrap(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              data.task,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.black, size: 28,),
                              onPressed: () => !boardBloc.addLoading ? Navigator.pop(context) : false,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(bottom: 10, top: 5),
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Total Pengeluaran Di Destinasi',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 55),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtil.secondaryColor, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "Batal",
                                    style: TextStyle(
                                        color: ColorUtil.secondaryColor, fontSize: 15, fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () => !boardBloc.addLoading ? Navigator.pop(context) : false,
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5), color: ColorUtil.primaryColor),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        boardBloc.addLoading ? SizedBox(
                                          child: CircularProgressIndicator(
                                              backgroundColor: Colors.white,
                                              valueColor: AlwaysStoppedAnimation(ColorUtil.primaryColor)),
                                          height: 16,
                                          width: 16,
                                        )
                                            : Text(
                                          "Simpan",
                                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                ),
                                onTap: () {
                                  if (priceController.text.length > 0) {
                                    boardBloc.dispatch(MarkAsDoneTask(data: data, total: priceController.text));
                                  } else {
                                    Toast.show("Masukkan total pengeluaran di destinasi tersebut.", context, duration:
                                    Toast
                                        .LENGTH_SHORT, gravity: Toast
                                        .BOTTOM);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ));
        });
  }

  void showDeleteAlert(BuildContext context, BoardDetailDataModel data) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              color: Colors.transparent,
              child: Wrap(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              data.task,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.black, size: 28,),
                              onPressed: () => !boardBloc.addLoading ? Navigator.pop(context) : false,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(bottom: 10, top: 5),
                        child: Text("Apakah anda ingin menghapus destinasi ini?")
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 55),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorUtil.secondaryColor, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "Batal",
                                    style: TextStyle(
                                        color: ColorUtil.secondaryColor, fontSize: 15, fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () => !boardBloc.addLoading ? Navigator.pop(context) : false,
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5), color: ColorUtil.primaryColor),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        boardBloc.addLoading ? SizedBox(
                                          child: CircularProgressIndicator(
                                              backgroundColor: Colors.white,
                                              valueColor: AlwaysStoppedAnimation(ColorUtil.primaryColor)),
                                          height: 16,
                                          width: 16,
                                        )
                                            : Text(
                                          "Simpan",
                                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                ),
                                onTap: () {
                                  boardBloc.dispatch(DeleteTaskEvent(id: data.id));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ));
        });
  }
}
