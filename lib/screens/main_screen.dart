import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
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
  BoardBloc boardBloc;
  MainBloc mainBloc;
  final TextEditingController _namaController = new TextEditingController();
  final TextEditingController _tanggalController = new TextEditingController();
  final DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm');

  MainScreen({Key key, this.homeBloc}) : super(key: key);

  final SharedPreferencesHelper help = SharedPreferencesHelper();


  @override
  Widget build(BuildContext context) {
    boardBloc = BlocProvider.of<BoardBloc>(context);
    mainBloc = BlocProvider.of<MainBloc>(context);
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
                      padding: EdgeInsets.only(left: 10, top: 8, bottom: 8, right: 15),
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
                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
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
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              MultiBlocListener(
                listeners: [
                  BlocListener(
                    bloc: boardBloc,
                    listener: (context, state) {
                      if (state is BoardDeletedErrorState) {
                        Toast.show(state.message, context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                      } else if (state is BoardDeletedState) {
                        Navigator.pop(context);
                        mainBloc.dispatch(LoadHomeEvent());
                        Toast.show("Board berhasil dihapus.", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                      }
                    },
                  ),
                  BlocListener(
                    bloc: mainBloc,
                    listener: (context, state) {
                      if (state is HomeLoadedState) {

                      }
                    },
                  )
                ],
                child: BlocBuilder(
                  bloc: mainBloc,
                  builder: (context, state) {
                    return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        child: state is HomeLoadedState
                            ? mainBloc.listBoards.length > 0
                                ? ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: mainBloc.listBoards.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      BoardDataModel data = mainBloc.listBoards[index];
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => DetailBoardPage(
                                                  data: data,
                                                ))),
                                        child: Slidable(
                                          actionPane: SlidableDrawerActionPane(),
                                          actionExtentRatio: 0.25,
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 5),
                                            padding: EdgeInsets.symmetric(vertical: 15),
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
                                                        shape: BoxShape.circle, color: ColorUtil.greenColor)),
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
                                                          "Trip mulai pada tanggal " +
                                                              tanggal(data.date, shortMonth: true),
                                                          style: TextStyle(color: ColorUtil.greyColor, fontSize: 14),
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
                                              onTap: () => deleteConfirmation(context, data),
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
                                                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM),
                                              focusColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                                    child: Text(
                                      "Tidak ada rencana.",
                                      style: TextStyle(color: ColorUtil.greyColor, fontSize: 16),
                                    ),
                                  )
                            : Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(10),
                                child: CircularProgressIndicator()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorUtil.secondaryColor,
        onPressed: () => showAsBottomSheet(context),
        elevation: 1,
        hoverElevation: 1,
        focusElevation: 1,
        highlightElevation: 1,
        disabledElevation: 0,
        splashColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void showAsBottomSheet(BuildContext context) {
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
          return BlocListener(
            bloc: boardBloc,
            listener: (context, state) {
              if (state is DateChangedBoardState) {
                this._tanggalController.text = tanggal(state.data);
              } else if (state is SuccessAddBoardState) {
                Toast.show("Berhasil menambahkan board.", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                Navigator.pop(context);
                mainBloc.dispatch(LoadHomeEvent());
              } else if (state is FailedAddBoardState) {
                Toast.show(state.message, context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              }
            },
            child: BlocBuilder(
              bloc: boardBloc,
              builder: (context, state) {
                return WillPopScope(
                  onWillPop: () async => false,
                  child: Container(
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
                                      'Tambah Board',
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
                                  controller: _namaController,
                                  decoration: InputDecoration(
                                    labelText: 'Nama Board',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                margin: EdgeInsets.only(bottom: 20, top: 5),
                                child: TextFormField(
                                  controller: _tanggalController,
                                  onTap: () async {
                                    final selectedDate = await _selectDate(context);
                                    if (selectedDate == null) return;

                                    final selectedTime = await _selectTime(context);
                                    if (selectedTime == null) return;

                                    DateTime _dateTime;

                                    _dateTime = DateTime(
                                        selectedDate.year,
                                        selectedDate.month,
                                        selectedDate.day,
                                        selectedTime.hour,
                                        selectedTime.minute
                                    );

                                    boardBloc.dispatch(SelectDateTimeBoardEvent(data: _dateTime));
                                  },
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: 'Tanggal Berangkat',
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
                                        onTap: () => boardBloc.dispatch(AddBoardEvent(name: _namaController.text)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                );
              },
            ),
          );
        });
  }
  void deleteConfirmation(BuildContext context, BoardDataModel data) {
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
          return WillPopScope(
            onWillPop: () async => false,
            child: Container(
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
                                'Hapus Board',
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
                          child: Text(
                            'Apakah anda ingin menghapus board ?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
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
                                            "Hapus",
                                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )
                                  ),
                                  onTap: () => boardBloc.dispatch(DeleteBoardEvent(id: data.id)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }

  Future<DateTime> _selectDate(BuildContext context) => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2010),
    lastDate: DateTime(2045),
  );

  Future<TimeOfDay> _selectTime(BuildContext context) {
    final now = DateTime.now();

    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
  }
}
