import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(fontSize: 60.0, fontFamily: 'Spartan MB');

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kInputDecoration = InputDecoration(
    hintText: 'Enter the city',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none,
    ));
