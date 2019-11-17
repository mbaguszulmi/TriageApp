import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/add.dart';
import 'pages/history.dart';
import 'pages/home.dart';
import 'pages/profile.dart';
import 'package:barcode_scan/barcode_scan.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentPage = 0;
  final List<Widget> _page = [
    Home(),
    Add(),
    History(),
    Profile(),
  ];
  final PageStorageBucket _pageBucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F5FF),
      body: PageStorage(
        child: _page[_currentPage],
        bucket: _pageBucket,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        shape: CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 110,
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,

                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                setState(() {
                                  _currentPage = 0;
                                });
                              },
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.026, left: MediaQuery.of(context).size.width*0.026),
                                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.026),
                                child: Icon(
                                  Icons.home,
                                  color: (_currentPage == 0) ? Color(0xFFCF6F80) : Colors.black,
                                ),
                              )
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                setState(() {
                                  _currentPage = 1;
                                });
                              },
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.026, left: MediaQuery.of(context).size.width*0.026),
                                child: Icon(
                                  Icons.add_box,
                                  color: (_currentPage == 1) ? Color(0xFFCF6F80) : Colors.black,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                setState(() {
                                  _currentPage = 2;
                                });
                              },
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.026, left: MediaQuery.of(context).size.width*0.026),
                                child: Icon(
                                  Icons.history,
                                  color: (_currentPage == 2) ? Color(0xFFCF6F80) : Colors.black,
                                ),
                              )
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                setState(() {
                                  _currentPage = 3;
                                });
                              },
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.026, left: MediaQuery.of(context).size.width*0.026),
                                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.026),
                                child: Icon(
                                  Icons.person,
                                  color: (_currentPage == 3) ? Color(0xFFCF6F80) : Colors.black,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.topCenter,

                child: Container(
                  width: 94,
                  height: 94,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F5FF),
                    borderRadius: BorderRadius.circular(47),
                  ),

                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((MediaQuery.of(context).size.width - 16)*0.5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular((MediaQuery.of(context).size.width - 16)*0.5),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScan()));
                        try {
                          BarcodeScanner.scan().then((value) => {
                            print('Barcode: '+value)
                          }).catchError((error) => print('Error : $error'));
                        } catch (e) {
                          if (e.code == BarcodeScanner.CameraAccessDenied) {
                            print('Access Denied!');
                          } else {
                            print('Unknown Error');
                          }
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/svg/barcode.svg',
                          semanticsLabel: 'Barcode Icon',
                          height: 30,
                          color: Colors.black,
                        )
                      ),
                    ),
                  )
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}