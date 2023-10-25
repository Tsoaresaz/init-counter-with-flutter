import 'package:flutter/material.dart';

Widget ButtonFloat(BuildContext context, String tooltip, IconData icon,
    void Function() callback) {
  return FloatingActionButton(
    onPressed: callback,
    tooltip: tooltip,
    child: Icon(icon),
  );
}
