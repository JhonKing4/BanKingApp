import 'package:flutter/material.dart';
import 'dart:math';
ValueNotifier<int> tabIndexNotifier = ValueNotifier<int>(0);



  String generateReference() {
    final random = Random();
    return (1000000000 + random.nextInt(999999999)).toString(); // 10 dígitos
  }