import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

// ignore: camel_case_types
class resultPage extends StatelessWidget {
  resultPage(
      {Key? key, required this.bmi, required this.text, required this.result})
      : super(key: key);

  final String bmi;
  final String text;
  final String result;
  final Uri _url = Uri.parse('https://en.wikipedia.org/wiki/Body_mass_index');

  void _takeScreenshotAndShare() async {
    Share.share(
        'Check out my BMI result!\n\nBMI: ${double.parse(bmi).isNaN ? '0.0' : bmi}\n\n$result\n\n$text');
  }

  @override
  Widget build(BuildContext context) {
    var bmi2 = double.parse(bmi);
    void _launchUrl() async {
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Your Result',
          style: TextStyle(color: Color(0xFF4D5760)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Colors.black12,
                  offset: Offset(-1, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Your BMI is',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D4852),
                  ),
                ),
                Text(
                  bmi2.isNaN ? '0.0' : bmi,
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D4852),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 250,
                  height: 30,
                  child: SfLinearGauge(
                    showLabels: false,
                    showAxisTrack: false,
                    showTicks: false,
                    minimum: 15,
                    maximum: 28,
                    ranges: const [
                      LinearGaugeRange(
                        edgeStyle: LinearEdgeStyle.endCurve,
                        startWidth: 13,
                        endWidth: 13,
                        color: Color(0xFF4F7DF9),
                        startValue: 24.6,
                        endValue: 28,
                      ),
                      LinearGaugeRange(
                        edgeStyle: LinearEdgeStyle.endCurve,
                        startWidth: 13,
                        endWidth: 13,
                        color: Color(0xFF81A3FF),
                        startValue: 18.1,
                        endValue: 24.9,
                      ),
                      LinearGaugeRange(
                        edgeStyle: LinearEdgeStyle.bothCurve,
                        startWidth: 13,
                        endWidth: 13,
                        color: Color(0xFFBBCDFD),
                        startValue: 15,
                        endValue: 18.4,
                      ),
                    ],
                    markerPointers: [
                      LinearWidgetPointer(
                        position: LinearElementPosition.outside,
                        value: bmi2.isNaN ? 0.0 : bmi2,
                        child: Container(
                          height: 30,
                          width: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF2A256C),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D4852),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10.0)),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF4F7DF9),
                        ),
                        fixedSize: MaterialStateProperty.all(
                            const Size.fromWidth(135)),
                      ),
                      onPressed: (() {
                        _launchUrl();
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'Full Details',
                            style: TextStyle(fontSize: 15),
                          ),
                          Icon(FontAwesomeIcons.arrowRightLong)
                        ],
                      )),
                )
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: IconButton(
                    onPressed: _takeScreenshotAndShare,
                    icon: const Icon(Icons.share),
                    color: const Color(0xFF4F7DF9),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: IconButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    icon: const FaIcon(FontAwesomeIcons.rotateLeft),
                    color: const Color(0xFF4F7DF9),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
