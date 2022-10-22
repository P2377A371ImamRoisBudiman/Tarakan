import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AcaraEvent extends StatefulWidget {
  const AcaraEvent({
    Key? key,
    required List get,
  })  : _get = get,
        super(key: key);

  final List _get;

  @override
  State<AcaraEvent> createState() => _AcaraEventState();
}

class _AcaraEventState extends State<AcaraEvent> {
  List _get = [];
  var apikey = '0f1e0759b0be449fab1b2bf04a6446c4';
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=${apikey}"));

// untuk mengecek apakah respon berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
//memasukan data yang di dapat dari internet ke variabel _get
          _get = data['articles'];
        });
      }
    } catch (e) {
//tampilkan error di terminal
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return GridView.builder(
      //wajib menggunakan 2 baris script di bawah ini, agar dapat digabung dengan widget lain
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // banyak grid yang ditampilkan dalam satu baris
          crossAxisCount: 2),
      itemBuilder: (_, index) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Column(
            children: [
              Image(
                image: NetworkImage(_get[index]['urlToImage'] ??
                    "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg"),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _get[index]['title'] ?? "No Title",
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ),
              Center(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: <Widget>[
                          new Icon(
                            CupertinoIcons.person,
                          ),
                          new Text("Peserta = "),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Icon(
                            CupertinoIcons.clock_solid,
                          ),
                          new Text("Waktu = "),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Icon(
                            CupertinoIcons.person_2_square_stack,
                          ),
                          new Text("Host = "),
                        ],
                      ),
                      SizedBox(
                        child: new LinearPercentIndicator(
                          padding: EdgeInsets.only(top: 5),
                          width: 300,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: 0.9,
                          center: Text("90.0%"),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      itemCount: _get.length,
    );
  }
}
