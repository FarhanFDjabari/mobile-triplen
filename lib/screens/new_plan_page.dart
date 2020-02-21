import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:triplen_app/screens/choose_location.dart';
import 'package:triplen_app/utils/color_util.dart';

class NewPlanPage extends StatefulWidget {
  NewPlanPage({Key key}) : super(key: key);

  @override
  _NewPlanPageState createState() => _NewPlanPageState();
}

class _NewPlanPageState extends State<NewPlanPage> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambahkan Rencana Liburan Baru",
          style: TextStyle(
              fontSize: 18,
              color: ColorUtil.primaryColor,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: ColorUtil.primaryColor,
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 5),
              child: TextField(
                decoration: InputDecoration(labelText: 'Nama Rencana'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
              child: InkWell(
                child: TextField(
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
                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Tanggal/Waktu',
                    prefixText: dateFormat.format(_dateTime),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Lokasi',
                    hintText: 'Nama Lokasi',
                    hintStyle: TextStyle(fontSize: 15)),
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorUtil.primaryColor),
                child: Text(
                  "Pilih Lokasi",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChooseLocation())),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: ColorUtil.greyColor, offset: Offset.fromDirection(3.0))
        ]),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          children: <Widget>[
            InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorUtil.TextSubHeaderGrey.withOpacity(0.5)),
                child: Text(
                  "Batal",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 65),
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
            ),
          ],
        ),
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
