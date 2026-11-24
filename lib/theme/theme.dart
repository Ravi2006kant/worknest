import 'package:flutter/material.dart';

class Theme {
  ColorScheme lightmode = ColorScheme.light(
    brightness: Brightness.light,

    primary: Color(0xFF2563EB),

    //       White:              #FFFFFF
    //       App Background:     #F8FAFC
    //       Dark Text:          #0F172A
    //       Secondary Text:     #64748B
    //       Border:             #E2E8F0
    //       Success Green:      #16A34A
  );
  ColorScheme darkmode = ColorScheme.light(
    brightness: Brightness.dark,

    primary: Color(0xFF2563EB),
  );
}
