import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:triplen_app/screens/login_screen.dart';
import 'package:triplen_app/utils/color_util.dart';


class SliderScreen extends StatefulWidget {
  SliderScreen({Key key}) : super(key: key);

  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "",
        description:
        "Temukan pengalaman liburan dalam ponselmu",
        styleDescription: TextStyle(
            color: ColorUtil.primaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans'),
        pathImage: "assets/travelling.png",
        marginDescription: EdgeInsets.all(50),
        widthImage: 200.0,
        heightImage: 200.0,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "",
        styleTitle: TextStyle(
            color: ColorUtil.BlueIcon,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans'),
        description: "Buat aktivitas liburanmu sendiri dengan mudah dan cepat",
        styleDescription: TextStyle(
            color: ColorUtil.primaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans'),
        pathImage: "assets/picawal.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: '',
        marginTitle: EdgeInsets.only(top: 0,bottom: 15),
        marginDescription: EdgeInsets.only(top: 0),
        description: 'Ayo Coba Sekarang!',
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans'
        ),
        pathImage: "assets/undraw_travel_mode_7sf4.png",
        heightImage: 350.0,
        widthImage: 350.0,
        backgroundColor: ColorUtil.secondaryColor,
      ),
    );
  }

  void onDonePress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void onSkipPress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  Widget renderNextBtn() {
    return Text("Selanjutnya", style: TextStyle(fontSize: 12));
  }

  Widget renderDoneBtn() {
    return Text("Selesai", style: TextStyle(fontSize: 12, color: Colors.white));
  }

  Widget renderSkipBtn() {
    return Text("Lewati", style: TextStyle(fontSize: 12),);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      colorSkipBtn: Colors.transparent,
      highlightColorSkipBtn: ColorUtil.BellGrey,

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Colors.transparent,
      highlightColorDoneBtn: ColorUtil.BellGrey,
      styleNameDoneBtn: TextStyle(fontSize: 12),
      styleNamePrevBtn: TextStyle(fontSize: 12),
      styleNameSkipBtn: TextStyle(fontSize: 12),

      // Dot indicator
      colorDot: Colors.grey,
      colorActiveDot: ColorUtil.primaryColor,
      sizeDot: 12.0,
    );
  }
}