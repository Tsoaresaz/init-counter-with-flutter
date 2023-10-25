import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentTimeWidget extends StatefulWidget {
  @override
  _CurrentTimeWidget createState() => _CurrentTimeWidget();
}

class _CurrentTimeWidget extends State<CurrentTimeWidget> {
  String _currentTime;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        var current = DateTime.now();
        var formated = DateFormat('dd/MM/yyyy HH:mm:ss');
        _currentTime = formated.format(current);
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        _currentTime ?? 'Carregando...',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
