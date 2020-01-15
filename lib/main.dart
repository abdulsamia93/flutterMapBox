import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
    int x=0;
 ope(){
   print(x.toString());
   if(x==0){
   setState(() {
        x=1;
   });
   }else{
      setState(() {
        x=0;
   });  
   }
   print(x.toString());
 }
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Map Free"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            mape(ope),
            x==0? Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 3,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Container(
                  height: 100,
                ),
              ),
            ): Container(),
          ],
        ),
      ),
    );
  }
}

Widget mape(ope) {
  return Container(
    child: FlutterMap(
      options: MapOptions(
        zoom: 13.0,
        center: LatLng(32.762117, 12.567029),
      ),
      layers: [
        TileLayerOptions(
          //  urlTemplate: "https://api.tiles.mapbox.com/"
          //   "styles/v1/abdulsamia/ck4swa67b0i1j1cphrgdzqb1h"
          //   "/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWJkdWxzYW1pYSIsImEiOiJjanYyODA5djExbGhvNGVtMjVidHdpa3c1In0.IOwdjTkoHM_g9fSY_xaD-g",

            urlTemplate: "https://api.tiles.mapbox.com/v4/"
                "mapbox.streets/{z}/{x}/{y}@2x.png?access_token=pk.eyJ1IjoiYWJkdWxzYW1pYSIsImEiOiJjanYyODA5djExbGhvNGVtMjVidHdpa3c1In0.IOwdjTkoHM_g9fSY_xaD-g",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(markers: [
          Marker(
              width: 130.0,
              height: 130.0,
              point: LatLng(32.762117, 12.567029),
              builder: (ctx) => mark(ope)),
        ]),
      ],
    ),
  );
}

Widget mark(ope) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0x33f52c56),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100.0),
          topRight: Radius.circular(100.0),
          bottomRight: Radius.circular(100.0),
          bottomLeft: Radius.circular(100.0),
        )),
    child: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Color(0xfff52c56),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(140.0),
              topRight: Radius.circular(140.0),
              bottomRight: Radius.circular(140.0),
              bottomLeft: Radius.circular(140.0),
            )),
        child: IconButton(
          icon: Icon(
            Icons.help,
            color: Colors.white,
            size: 40,
          ),
          onPressed: ope,
        )),
  );
}
