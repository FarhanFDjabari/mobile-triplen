import 'package:flutter/material.dart';

class HistoryDetail extends StatelessWidget {
  HistoryDetail({Key key}) : super(key: key);

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
          ],
        ),
      ),
    );
  }
}