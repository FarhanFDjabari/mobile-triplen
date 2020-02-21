import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triplen_app/utils/color_util.dart';

class ChooseLocation extends StatefulWidget {
  ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cari Lokasi Liburanmu",
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
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF6F8FD),
                      hintText: "Cari Lokasi ...",
                      hintStyle:
                          TextStyle(color: Color(0xFFB0BEC5), fontSize: 18.0),
                      suffixIcon: Icon(Icons.search)),
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Expanded(
                child: ListView.separated(
//                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
//                      return Container(
//                        margin: EdgeInsets.symmetric(vertical: 5),
//                        padding: EdgeInsets.symmetric(
//                            vertical: 15, horizontal: 15),
//                        decoration: BoxDecoration(
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(5)),
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Color(0XFFD3D6DA).withAlpha(100),
//                                  offset: Offset(0, 0),
//                                  blurRadius: 1,
//                                  spreadRadius: 1)
//                            ],
//                            color: Colors.white),
//                        child: Row(
//                          children: <Widget>[
//                            Container(
//                              child: Ic,
//                            ),
//                          ],
//                        ),
//                      );
                    return ListTile(
                      leading: Icon(Icons.pin_drop, size: 32, color: Colors.deepPurple,),
                      title: Text('Lokasiku', style: TextStyle(
                        color: ColorUtil.secondaryColor, fontSize: 16
                      ),),
                      subtitle: Text('Jl. Soekarno Hatta No 25', style: TextStyle(
                        color: ColorUtil.greyColor, fontSize: 14
                      ),),
                    );
                    }, separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
