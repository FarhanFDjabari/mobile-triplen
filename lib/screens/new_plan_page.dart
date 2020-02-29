import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'package:triplen_app/bloc/board/bloc.dart';
import 'package:triplen_app/models/board_model.dart';
import 'package:triplen_app/screens/choose_location.dart';
import 'package:triplen_app/utils/color_util.dart';

class NewPlanPage extends StatefulWidget {
  final BoardDataModel data;
  NewPlanPage({Key key, this.data}) : super(key: key);

  @override
  _NewPlanPageState createState() => _NewPlanPageState();
}

class _NewPlanPageState extends State<NewPlanPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  TextEditingController _namaController = new TextEditingController();
  TextEditingController _tanggalController = new TextEditingController();
  TextEditingController _lokasiController = new TextEditingController();
  BoardBloc boardBloc;

  @override
  void initState() {
    // TODO: implement initState
    boardBloc = BlocProvider.of<BoardBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener(
      bloc: boardBloc,
      listener: (context, state) {
        if (state is MapSelectedState) {
          _lokasiController.text = boardBloc.selectedMaps.formattedAddress;
        } else if (state is AddTaskSuccessState) {
          Toast.show("Berhasil membuat rencana perjalanan.", context, duration: Toast.LENGTH_SHORT, gravity: Toast
              .BOTTOM);
          boardBloc.dispatch(LoadDetailBoardEvent(data: widget.data));
          Navigator.pop(context);
        } else if (state is AddTaskFailedState) {
          Toast.show(state.message, context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        }
      },
      child: BlocBuilder(
        bloc: boardBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Tambahkan Rencana Liburan Baru",
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
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 5),
                        child: TextFormField(
                          controller: _namaController,
                          decoration: InputDecoration(labelText: 'Nama Rencana'),
                          validator: (value) {
                            if (value.length == 0) {
                              return "Masukkan nama task!";
                            }
                            return null;
                          },
                          autovalidate: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                        child: InkWell(
                          child: TextFormField(
                            onTap: () async {
                              final selectedDate = await _selectDate(context);
                              if (selectedDate == null) return;

                              final selectedTime = await _selectTime(context);
                              if (selectedTime == null) return;

                              setState(() {
                                _dateTime = DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    selectedTime.hour,
                                    selectedTime.minute
                                );
                                _tanggalController.text = dateFormat.format(_dateTime);
                              });
                            },
                            readOnly: true,
                            controller: _tanggalController,
                            decoration: InputDecoration(
                              labelText: 'Tanggal/Waktu',
                            ),
                            validator: (value) {
                              if (value.length == 0) {
                                return "Pilih tanggal kunjungan!";
                              }
                              return null;
                            },
                            autovalidate: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ChooseLocation(bloc: boardBloc))),
                          child: TextFormField(
                            enabled: false,
                            controller: _lokasiController,
                            decoration: InputDecoration(
                                labelText: 'Lokasi',
                                hintText: 'Nama Lokasi',
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 50),
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorUtil.secondaryColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: Icon(Icons.map, color: Colors.white,),
                                ),
                                Text(
                                  "Pilih Lokasi",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ChooseLocation(bloc: boardBloc))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: ColorUtil.greyColor, offset: Offset.fromDirection(3.0))
                ]),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                            margin: EdgeInsets.only(left: 5),
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorUtil.secondaryColor, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Batal",
                                  style: TextStyle(
                                      color: ColorUtil.secondaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                        ),
                        onTap: () => Navigator.pop(context),
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
                                boardBloc.isLoading ? SizedBox(
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
                          if (boardBloc.selectedMaps.name == null) {
                            Toast.show("Pilih lokasi kunjungan!", context, duration: Toast.LENGTH_SHORT, gravity: Toast
                                .BOTTOM);
                          } else if (_formKey.currentState.validate() && !boardBloc.isLoading) {
                            boardBloc.dispatch(SaveTaskEvent(id: widget.data.id.toString(), date: _dateTime, name:
                            _namaController
                                .text));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
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
