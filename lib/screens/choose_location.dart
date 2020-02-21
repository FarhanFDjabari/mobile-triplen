import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
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
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SearchBar<ChooseLocation>(
            searchBarPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
            headerPadding: EdgeInsets.symmetric(horizontal: 10),
            listPadding: EdgeInsets.symmetric(horizontal: 10),
//          onSearch: ,
//          searchBarController: _searchBarController,
            indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),
            onCancelled: () {
              print("Cancelled triggered");
            },
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            onItemFound: (ChooseLocation post, int index) {
              return Container(
                color: Colors.lightBlue,
                child: ListTile(
                  title: Text('cari'),
                  isThreeLine: true,
                  subtitle: Text('subtitle'),
                  onTap: () {
//                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail()));
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
