import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gracias/view/clock.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';

class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  // ignore: prefer_typing_uninitialized_variables
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/images/background_gracias.png'),
                fit: BoxFit.fill)),
        width: width / 1,
        height: height / 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//Kolom Logo Tarakan Start
            Container(
              width: width / 3,
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/tarakanlogo.png",
                    height: height / 6,
                  ),
                  Center(
                    child: Container(
                      height: height / 2,
                      padding: const EdgeInsets.only(
                        right: 5,
                        left: 5,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(74, 172, 144, 50),
                            Color.fromRGBO(210, 223, 205, 50),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Container(
                    height: height / 6,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                    child: GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return JamDigital();
                        }));
                      },
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              width: 200,
                              height: 50,
                              child: FittedBox(
                                child: Text(
                                  // Formatted Date
                                  DateFormat.yMMMEd()

                                      // displaying formatted date
                                      .format(DateTime.now()),
                                  style: TextStyle(

                                      // Styling text
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            DigitalClock(
                              showSecondsDigit: false,
                              areaDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              areaAligment: AlignmentDirectional.center,
                              hourMinuteDigitDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              hourMinuteDigitTextStyle: TextStyle(fontSize: 50),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
//Kolom Logo Tarakan End
//Expanded Grid Card Start
            Expanded(
              child: Container(
                color: const Color.fromRGBO(240, 240, 240, 30),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(16.0),
                  childAspectRatio: 8.0 / 9.0,
                  // TODO: Build a grid of cards (102)
                  children: <Widget>[
                    Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 18.0 / 11.0,
                            child: Image.asset('assets/images/logos.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 12.0, 16.0, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Title'),
                                const SizedBox(height: 8.0),
                                Text('Secondary Text'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
//Expanded Grid Card End
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: FittedBox(
            child: Column(
          children: [
            Icon(CupertinoIcons.add),
            Text("Tambah Kegiatan"),
          ],
        )),
      ),
    );
  }
}
