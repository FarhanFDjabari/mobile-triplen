import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triplen_app/bloc/board/bloc.dart';
import 'package:triplen_app/utils/color_util.dart';

class ChooseLocation extends StatefulWidget {
  final BoardBloc bloc;
  ChooseLocation({Key key, this.bloc}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  TextEditingController locationController = TextEditingController();
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
        child: BlocListener(
          bloc: widget.bloc,
          listener: (context, state) {
          },
          child: BlocBuilder(
            bloc: widget.bloc,
            builder: (context, state) {
              return Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: locationController,
                        onFieldSubmitted: (value) {
                          widget.bloc.dispatch(SearchMapsEvent(query: value));
                        },
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
                            hintStyle: TextStyle(color: Color(0xFFB0BEC5), fontSize: 18.0),
                            suffixIcon: Icon(Icons.search)),
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: widget.bloc.isLoading ? Center(child: CircularProgressIndicator(),) :
                      widget.bloc.listMaps.length > 0 ? ListView.separated(
//                  physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        itemCount: widget.bloc.listMaps.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              widget.bloc.dispatch(SelectMapsEvent(mapsDataModel: widget.bloc
                                  .listMaps[index]));
                            },
                            leading: Icon(Icons.pin_drop, size: 32, color: Colors.deepPurple,),
                            title: Text(widget.bloc.listMaps[index].name, style: TextStyle(
                                color: ColorUtil.secondaryColor, fontSize: 16
                            ),),
                            subtitle: Text(widget.bloc.listMaps[index].formattedAddress, style: TextStyle(
                                color: ColorUtil.greyColor, fontSize: 14
                            ),),
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },) : Center(child: Text("Cari lokasi."),),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
