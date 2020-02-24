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
  DateFormat dateFormat = DateFormat('yyyy-MMM-dd HH:mm:ss');
  TextEditingController _namaController = new TextEditingController();
  TextEditingController _tanggalController = new TextEditingController();
  TextEditingController _lokasiController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Nama Rencana'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
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
                        _tanggalController.text = dateFormat.format(_dateTime);
                      });
                    },
                    readOnly: true,
                    controller: _tanggalController,
                    decoration: InputDecoration(
                      labelText: 'Tanggal/Waktu',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: TextField(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChooseLocation())),
                  decoration: InputDecoration(
                      labelText: 'Lokasi',
                      hintText: 'Nama Lokasi',
                      hintStyle: TextStyle(fontSize: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 50),
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
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
                      MaterialPageRoute(builder: (context) => ChooseLocation())),
                ),
              ),
            ],
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
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 15),
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
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorUtil.secondaryColor),
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
              ),
            ],
          ),
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
