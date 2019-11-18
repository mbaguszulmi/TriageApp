import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 110,
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        'assets/svg/bottomcurve.svg',
                        width: MediaQuery.of(context).size.width,
                        semanticsLabel: 'Bottom curve',
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(top: 20),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              CircularPercentIndicator(
                                radius: MediaQuery.of(context).size.width*0.2,
                                lineWidth: 10.0,
                                percent: 0.5,
                                progressColor: Color(0xFFF12B2C),
                                backgroundColor: Color(0xFFEEEEEE),
                                center: Text('Total'),
                                circularStrokeCap: CircularStrokeCap.round,
                                animation: true,
                                animationDuration: 500,
                              ),
                              CircularPercentIndicator(
                                radius: MediaQuery.of(context).size.width*0.3,
                                lineWidth: 10.0,
                                percent: 0.6,
                                progressColor: Color(0xFFFFBF85),
                                backgroundColor: Color(0xFFEEEEEE),
                                circularStrokeCap: CircularStrokeCap.round,
                                animation: true,
                                animationDuration: 600,
                              ),
                              CircularPercentIndicator(
                                radius: MediaQuery.of(context).size.width*0.4,
                                lineWidth: 10.0,
                                percent: 0.7,
                                progressColor: Color(0xFF29CC97),
                                backgroundColor: Color(0xFFEEEEEE),
                                circularStrokeCap: CircularStrokeCap.round,
                                animation: true,
                                animationDuration: 700,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 14,
                                        width: 14,
                                        margin: EdgeInsets.only(right: 10, top:10, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFF29CC97)
                                          )
                                        ),
                                      ),
                                      Container(
                                        child: Text('Normal')
                                      )
                                    ],
                                  ),
                                  Text(
                                    '23043',
                                    style: TextStyle(
                                      color: Color(0xFF29CC97)
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                // mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 14,
                                        width: 14,
                                        margin: EdgeInsets.only(right: 10, top:10, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFFFFBF85)
                                          )
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Text('Low')
                                      )
                                    ],
                                  ),
                                  Text(
                                    '14568',
                                    style: TextStyle(
                                      color: Color(0xFFFFBF85)
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                // mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 14,
                                        width: 14,
                                        margin: EdgeInsets.only(right: 10, top:10, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFFF12B2C)
                                          )
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Text('High')
                                      )
                                    ],
                                  ),
                                  Text(
                                    '4758',
                                    style: TextStyle(
                                      color: Color(0xFFF12B2C)
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            )
            
          ],
        )
      )
    );
  }
}