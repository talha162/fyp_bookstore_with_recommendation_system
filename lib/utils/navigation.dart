import 'package:flutter/material.dart';

navigateWithNoBack(BuildContext context, screenname) {
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => screenname,
    ),
  );
}
