import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triplen_app/utils/color_util.dart';

class DetailNewsPage extends StatelessWidget {
  DetailNewsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: TextStyle(
              fontSize: 18,
              color: ColorUtil.secondaryColor,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: ColorUtil.secondaryColor,
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(0),
                  child: Image.asset(
                    'assets/809782487.jpg',
                    scale: 0.5,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 0, right: 70),
                        child: Text(
                          'Tempat Wisata Malam Yogyakarta',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2, left: 0, right: 210),
                        child: Text(
                          '08/02/2020, 06:50 WIB',
                          style: TextStyle(
                            color: ColorUtil.secondaryColor.withOpacity(0.8),
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Yogyakarta merupakan kota yang menyuguhkan keelokan tak ada habisnya. '
                      'Kota yang akrab dengan sebutan Jogja ini memang menjadi salah satu tempat yang disinggahi '
                      'banyak wisatawan untuk liburan. Tak hanya dari dalam negeri saja, wisatawan luar negeri '
                      'juga turut datang berbodong-bondong terpesona dengan keindahan Jogja. Hal yang menjadi '
                      'daya tarik seseorang datang ke Jogja adalah kebudayaan dan keindahan alamnya. Jogja menyuguhi '
                      'wisata yang beragam, mulai dari wisata alam, wisata budaya dan ada pula wisata malamnya. Tak akan cukup sehari atau dua '
                      'hari saja untuk mengunjungi wisata-wisata indah tersebut. Nah, jika kamu berkunjung ke Jogja, maka kamu harus menyaksikan '
                      'keindahan malam kota ini. Romantisme Jogja di malam hari akan membuat kamu rindu dengan dan ingin kembali lagi ke kota ini. '
                      'Kamu akan kangen dengan setiap suasananya yang disuguhkan. Ketika senja menjelang, suasana kota terasa begitu indah. '
                      'Terlebih saat malam hari.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
