import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class VictimList {
  final String nama;
  /** 
   * 0 = green
   * 1 = yellow
   * 2 = red
  */
  final int level;
  final DateTime _dateTime;
  /**
   * 0 = synced
   * 1 = syncing
   * 2 = failed
   */
  final int syncStatus;

  VictimList(this.nama, this.level, this._dateTime, this.syncStatus);

  String getDateStr() {
    return DateFormat("d M y").format(this._dateTime);
  }
}

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Stack(
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
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {

                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg/sort-icon.svg',
                                  width: 16,
                                  semanticsLabel: 'Sort',
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Sort',
                                    style: TextStyle(
                                      color: Color(0xFF4B506D)
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {

                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg/filter-icon.svg',
                                  width: 16,
                                  semanticsLabel: 'Filter',
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Filter',
                                    style: TextStyle(
                                    color: Color(0xFF4B506D)
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      )
    );
  }
}