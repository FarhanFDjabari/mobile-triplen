import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:triplen_app/screens/login_screen.dart';
import 'package:triplen_app/utils/color_util.dart';


class intro extends StatefulWidget {
  intro({Key key}) : super(key: key);

  _introState createState() => _introState();
}

class _introState extends State<intro> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "",
        styleTitle: TextStyle(
            color: ColorUtil.BlueIcon,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans'),
        description:
        "Temukan pengalaman liburan dalam ponselmu",
        styleDescription: TextStyle(
            color: ColorUtil.BlueIcon,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans'),
        pathImage: "assets/images/travelling.png",
        widthImage: 50,
        heightImage: 50,
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
        description: "Buat aktivitas liburanmu sendiri dengan drag & drop",
        styleDescription: TextStyle(
            color: ColorUtil.BlueIcon,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans'),
        pathImage: "assets/images/picawal.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: '',
        description: '" Triplen app membuat pengalaman liburanmu menjadi lebih '
            'seru dan menakjubkan. "',
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'opensans'
        ),
        backgroundColor: ColorUtil.BlueIcon,
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
    return Icon(
      Icons.navigate_next,
      color: ColorUtil.BlueIcon,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: ColorUtil.BlueIcon,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: ColorUtil.BlueIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      colorSkipBtn: Colors.white70,
      highlightColorSkipBtn: ColorUtil.BellGrey,

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Colors.white70,
      highlightColorDoneBtn: ColorUtil.BellGrey,

      // Dot indicator
      colorDot: Colors.grey,
      colorActiveDot: ColorUtil.BlueIcon,
      sizeDot: 13.0,
    );
  }
}